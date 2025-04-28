import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      name: cartItemEntity.productEntity.name,
      code: cartItemEntity.productEntity.code,
      price: cartItemEntity.productEntity.price,
      quantity: cartItemEntity.count,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'code': code,
      'price': price,
      'quantity': quantity,
    };
  }
}
