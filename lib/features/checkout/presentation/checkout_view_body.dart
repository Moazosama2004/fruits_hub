import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [InActiveStepItem()]);
  }
}

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(Assets.imagesCheck),
        ),
        const SizedBox(width: 4),
        Text(
          'الشحن',
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text('2', style: AppTextStyles.semiBold13),
        ),
        const SizedBox(width: 5.5),
        Text(
          'العنوان',
          style: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
