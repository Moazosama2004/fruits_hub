import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String orderId;

  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
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
      orderId: const Uuid().v4(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'uId': uId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress': shippingAddressModel.toJson(),
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'orderProducts':
          orderProducts.map((product) => product.toJson()).toList(),
    };
  }
}
