import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_strings_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getPages().length,
      itemBuilder: (context, index) => getPages()[index],
    );
  }
}

List<Widget> getPages() {
  return [
    const ShippingSection(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
}
