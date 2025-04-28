import 'package:fruits_hub/core/helper/get_currency.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity orderEntity) => Amount(
    total: orderEntity.calculateTotalPriceAfterDiscountAndShipping().toString(),
    currency: getCurrency(),
    details: Details.fromEntity(orderEntity),
  );

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    total: json['total'] as String?,
    currency: json['currency'] as String?,
    details:
        json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
