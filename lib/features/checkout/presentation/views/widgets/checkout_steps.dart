import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        getStringsSteps().length,
        (index) => Expanded(
          child: InActiveStepItem(
            index: index.toString(),
            text: getStringsSteps()[index],
          ),
        ),
      ),
    );
  }

  List<String> getStringsSteps() {
    return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
  }
}
