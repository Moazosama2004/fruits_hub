import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(Assets.imagesProfileImage),
      ),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text(
        'معاذ أسامه',
        style: AppTextStyles.bold16.copyWith(color: Colors.black),
      ),
      trailing: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xffEEF8ED),
        child: SvgPicture.asset(Assets.imagesNotificationIcon),
      ),
    );
  }
}
