import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.isObsecure = false,
    this.keyboardType,
    this.onSaved,
    this.suffixIcon,
  });
  final String text;
  final Widget? suffixIcon;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      onChanged: (value) {
        log(value);
      },
      keyboardType: keyboardType,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        hintText: text,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xffE6E9EA)),
    );
  }
}
