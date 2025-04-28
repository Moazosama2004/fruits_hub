import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class OrderEntity {
  final List<CartItemInitial> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;

  OrderEntity({
    required this.cartItems,
    required this.payWithCash,
    required this.shippingAddressEntity,
  });
}
