import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_sliver_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_view_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context, title: 'السلة', showBackButton: true),
                  const SizedBox(height: 16),
                  const CartViewHeader(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            CartItemSliverList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.05,
          left: 0,
          right: 0,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomCartButton(),
          ),
        ),
      ],
    );
  }
}
