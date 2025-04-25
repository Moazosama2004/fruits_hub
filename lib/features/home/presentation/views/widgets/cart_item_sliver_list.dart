import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartItemSliverList extends StatelessWidget {
  const CartItemSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 20,
      separatorBuilder:
          (context, index) =>
              const Divider(height: 22, color: Color(0xFFF1F1F5)),
      itemBuilder:
          (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.5),
            child: CartItem(),
          ),
    );
  }
}
