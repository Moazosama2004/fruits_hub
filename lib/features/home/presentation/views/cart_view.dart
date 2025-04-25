import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_sliver_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_view_header.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
            const CartItemSliverList(),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.05,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: 'الدفع  120جنيه', onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
