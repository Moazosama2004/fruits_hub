import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_strings_steps.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getStringsSteps().length,
      itemBuilder: (context, index) {
        return const Placeholder();
      },
    );
  }
}
