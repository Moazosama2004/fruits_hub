import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesEditIcon),
        const SizedBox(width: 4),
        Text(
          'تعديل',
          style: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
