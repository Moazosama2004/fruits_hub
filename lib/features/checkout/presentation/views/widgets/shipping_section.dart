import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
          isSelected: currentIndex == 0,
          onTap: () {
            currentIndex = 0;
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع أونلاين ',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: 40,
          isSelected: currentIndex == 1,
          onTap: () {
            currentIndex = 1;
            setState(() {});
          },
        ),
      ],
    );
  }
}
