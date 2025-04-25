import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showBackButton = false,
  bool showleadingButton = false,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    actions: [
      Visibility(visible: showleadingButton, child: const NotificationWidget()),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
  );
}
