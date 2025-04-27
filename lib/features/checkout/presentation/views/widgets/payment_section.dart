import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_decorations.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderSummary(),
          SizedBox(height: 16),
          PaymentItem(
            title: 'يرجي تأكيد  طلبك',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('التوصيل  :', style: AppTextStyles.regular13),
                    Text('30جنية', style: AppTextStyles.semiBold13),
                  ],
                ),
                Divider(color: Color(0xFFCACECE), endIndent: 32, indent: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('الكلي', style: AppTextStyles.bold16),
                    Text('180 جنيه', style: AppTextStyles.bold16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
