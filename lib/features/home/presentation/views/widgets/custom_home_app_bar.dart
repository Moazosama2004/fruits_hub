import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/config/cache_helper/cache_helper.dart';
import 'package:fruits_hub/core/helper/get_user_entity.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

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
        getUserEntitiy().name,
        style: AppTextStyles.bold16.copyWith(color: Colors.black),
      ),
      trailing: const NotificationWidget(),
    );
  }
}
