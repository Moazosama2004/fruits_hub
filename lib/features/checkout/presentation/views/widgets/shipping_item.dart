import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_shipping_item_dot.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });
  final String title, subTitle;
  final int price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: AnimatedContainer(
          duration: const Duration(seconds: 5000),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: const Color(0x33D9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:
                    isSelected
                        ? const BorderSide(color: AppColors.primaryColor)
                        : const BorderSide(color: Colors.transparent),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected
                    ? const ActiveShippingItemDot()
                    : const InActiveShippingItemDot(),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.semiBold13),
                    const SizedBox(height: 6),
                    Text(
                      subTitle,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.regular13.copyWith(
                        color: Colors.black.withValues(alpha: 128),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    '$price جنيه',
                    style: AppTextStyles.bold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
