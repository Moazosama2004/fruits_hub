import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('المجموع الفرعي :', style: AppTextStyles.regular13),
              Text(
                '150 جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التوصيل  :', style: AppTextStyles.regular13),
              Text('30جنية', style: AppTextStyles.semiBold13),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            color: Color(0xFFCACECE),
            endIndent: 32,
            indent: 32,
            thickness: 0.5,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الكلي', style: AppTextStyles.bold16),
              Text('180 جنيه', style: AppTextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
