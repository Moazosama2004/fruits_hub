import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isChecked ? Colors.transparent : const Color(0xffDDDFDF),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(Assets.imagesCheck),
        ),
      ),
    );
  }
}
