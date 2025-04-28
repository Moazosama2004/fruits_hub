import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uId,
  });

  num calculateShippingCost() {
    return 30;
  }

  num calculateShippingDiscount() {
    return 0;
  }

  num calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
