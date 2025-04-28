import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(
                context,
                CheckoutView.routeName,
                arguments: context.read<CartCubit>().cartEntity,
              );
            } else {
              showErrorBar(context, message: 'السله فارغه');
            }
          },
        );
      },
    );
  }
}
