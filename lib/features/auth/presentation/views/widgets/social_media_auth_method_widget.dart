import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class SocialMediaAuthMethodWidget extends StatelessWidget {
  const SocialMediaAuthMethodWidget({
    super.key,
    required this.iconImage,
    required this.text,
    required this.onPressed,
  });
  final String iconImage;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xffDDDFDF)),
        ),
      ),
      onPressed: onPressed,
      child: ListTile(
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        leading: SvgPicture.asset(iconImage),
        title: Text(
          text,
          style: AppTextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
