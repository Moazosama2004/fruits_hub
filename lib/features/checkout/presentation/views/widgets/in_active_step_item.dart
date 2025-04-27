import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(index, style: AppTextStyles.semiBold13),
        ),
        const SizedBox(width: 5.5),
        Text(
          text,
          style: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
