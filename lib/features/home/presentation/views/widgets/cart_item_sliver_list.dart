import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartItemSliverList extends StatelessWidget {
  const CartItemSliverList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      separatorBuilder:
          (context, index) =>
              const Divider(height: 22, color: Color(0xFFF1F1F5)),
      itemBuilder:
          (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.5),
            child: CartItem(cartItemEntity: cartItems[index]),
          ),
    );
  }
}
