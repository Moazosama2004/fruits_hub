import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('المجموع الفرعي :', style: AppTextStyles.regular13),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()} جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.semiBold16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التوصيل  :', style: AppTextStyles.regular13),
              Text('30جنية', style: AppTextStyles.semiBold13),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Color(0xFFCACECE),
            endIndent: 32,
            indent: 32,
            thickness: 0.5,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('الكلي', style: AppTextStyles.bold16),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                style: AppTextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
