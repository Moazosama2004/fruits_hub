import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    subtotal: json['subtotal'] as String?,
    shipping: json['shipping'] as String?,
    shippingDiscount: json['shipping_discount'] as int?,
  );

  factory Details.fromEntity(OrderInputEntity orderEntity) => Details(
    subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
    shipping: orderEntity.calculateShippingCost().toString(),
    shippingDiscount: orderEntity.calculateShippingDiscount().toInt(),
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  @override
  String toString() =>
      'Details(subtotal: $subtotal, shipping: $shipping, shippingDiscount: $shippingDiscount)';
}
