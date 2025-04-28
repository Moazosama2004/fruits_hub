import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';

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
}
