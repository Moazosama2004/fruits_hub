import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(text, textAlign: TextAlign.center, style: AppTextStyles.bold19),
  );
}
