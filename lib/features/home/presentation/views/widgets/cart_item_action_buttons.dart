import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          backgroundColor: AppColors.primaryColor,
          iconColor: Colors.white,
          onTap: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          icon: Icons.add,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${cartItemEntity.count}',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          backgroundColor: const Color(0xFFF3F5F7),
          iconColor: Colors.grey,
          onTap: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          icon: Icons.remove,
        ),
      ],
    );
  }
}
