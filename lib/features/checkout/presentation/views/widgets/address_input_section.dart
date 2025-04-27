import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTextFormField(text: 'الاسم كامل'),
          const SizedBox(height: 8),
          const CustomTextFormField(text: 'البريد الإلكتروني'),
          const SizedBox(height: 8),
          const CustomTextFormField(text: 'العنوان'),
          const SizedBox(height: 8),
          const CustomTextFormField(text: 'المدينه'),
          const SizedBox(height: 8),
          const CustomTextFormField(text: 'رقم الطابق , رقم الشقه ..'),
          const SizedBox(height: 8),
          const CustomTextFormField(text: 'رقم الهاتف'),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 25,
                child: FittedBox(
                  child: Switch(value: true, onChanged: (value) {}),
                ),
              ),
              Text(
                'حفظ العنوان',
                style: AppTextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
