import 'package:fruits_hub/core/helper/get_currency.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity cartItemEntity) => Item(
    name: cartItemEntity.productEntity.name,
    quantity: cartItemEntity.count,
    price: cartItemEntity.productEntity.price.toString(),
    currency: getCurrency(),
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json['name'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as String?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
