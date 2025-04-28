import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/core/helper/get_next_page_string.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/pay_pal_payment_entity/pay_pal_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            currentIndex: currentIndex,
            pageController: pageController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: CheckOutStepsPageView(
                valueListenable: valueNotifier,
                pageController: pageController,
                formKey: _formKey,
              ),
            ),
          ),
          CustomButton(
            text: getNextPageString(currentIndex),
            onPressed: () {
              if (currentIndex == 0) {
                _handleShippingSectionNavigation(context);
              } else if (currentIndex == 1) {
                _handleAddressSectionNavigation(context);
              } else {
                _processPaypalPayment(orderEntity: orderEntity);
                // var orderEntity = context.read<OrderEntity>();
                // context.read<AddOrderCubit>().addOrder(
                //   orderEntity: orderEntity,
                // );
              }
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  void _handleShippingSectionNavigation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showErrorBar(context, message: 'يرجي اختيار طريقه الدفع');
    }
  }

  void _handleAddressSectionNavigation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPaypalPayment({required OrderEntity orderEntity}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: kPaypalClientId,
              secretKey: kPaypalSecretKey,
              transactions: [
                PayPalPaymentEntity.fromEntity(orderEntity).toJson(),
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
                Navigator.pop(context);
                showErrorBar(context, message: 'تمت العمليه بنجاح.');
              },
              onError: (error) {
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}
