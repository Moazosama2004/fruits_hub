import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          backgroundColor: AppColors.primaryColor,
          iconColor: Colors.white,
          onTap: () {},
          icon: Icons.add,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          backgroundColor: const Color(0xFFF3F5F7),
          iconColor: Colors.grey,
          onTap: () {},
          icon: Icons.remove,
        ),
      ],
    );
  }
}
