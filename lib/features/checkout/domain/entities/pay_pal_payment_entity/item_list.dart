import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(CartEntity cartEntity) => ItemList(
    items: cartEntity.cartItems.map((e) => Item.fromEntity(e)).toList(),
  );

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
