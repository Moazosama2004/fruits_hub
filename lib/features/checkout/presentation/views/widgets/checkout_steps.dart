import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/core/helper/get_strings_steps.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart'
    show OrderEntity;
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        getStringsSteps().length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.bounceIn,
                );
              } else {
                showErrorBar(context, message: 'يرجي اختيار طريقه الدفع');
              }
            },
            child: StepItem(
              index: '${index + 1}',
              isActive: index <= currentIndex,
              text: getStringsSteps()[index],
            ),
          ),
        ),
      ),
    );
  }
}
