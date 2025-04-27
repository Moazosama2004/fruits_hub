import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_decorations.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/confirm_order_widget.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [OrderSummary(), SizedBox(height: 16), ConfirmOrderWidget()],
      ),
    );
  }
}
