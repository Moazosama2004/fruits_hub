import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PayPalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PayPalPaymentEntity({this.amount, this.description, this.itemList});

  factory PayPalPaymentEntity.fromEntity(OrderEntity orderEntity) {
    return PayPalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: "The payment transaction description.",
      itemList: ItemList.fromEntity(orderEntity.cartEntity),
    );
  }

  factory PayPalPaymentEntity.fromJson(Map<String, dynamic> json) {
    return PayPalPaymentEntity(
      amount:
          json['amount'] == null
              ? null
              : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      itemList:
          json['item_list'] == null
              ? null
              : ItemList.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  @override
  String toString() =>
      'PayPalPaymentEntity(amount: $amount, description: $description, itemList: $itemList)';
}
