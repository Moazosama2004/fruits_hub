import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/edit_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class ConfirmOrderWidget extends StatelessWidget {
  const ConfirmOrderWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'يرجي تأكيد  طلبك',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('عنوان التوصيل', style: AppTextStyles.bold13),
              EditWidget(pageController: pageController),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocation),
              const SizedBox(width: 8),
              Text(
                context.read<OrderEntity>().shippingAddressEntity.toString(),
                textAlign: TextAlign.right,
                style: AppTextStyles.regular16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
