import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      uId: orderEntity.uId,
      totalPrice: orderEntity.cartEntity.calculateTotalPrice().toDouble(),
      paymentMethod: orderEntity.payWithCash == true ? 'CASH' : 'PayPal',
      shippingAddressModel: ShippingAddressModel.fromEntity(
        shippingAddressEntity: orderEntity.shippingAddressEntity,
      ),
      orderProducts:
          orderEntity.cartEntity.cartItems
              .map((item) => OrderProductModel.fromEntity(cartItemEntity: item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts':
          orderProducts.map((product) => product.toJson()).toList(),
    };
  }
}
