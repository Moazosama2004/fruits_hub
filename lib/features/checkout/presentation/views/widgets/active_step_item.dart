import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(Assets.imagesCheck),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    ));
  }
}
