import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculatorTotalPrice() {
    return productEntity.price * count;
  }

  increaseCount() {
    count++;
  }

  decreaseCount() {
    count--;
  }
}
