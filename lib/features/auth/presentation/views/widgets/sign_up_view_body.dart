import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: khorizitalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              text: 'الاسم كامل',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              text: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              text: 'كلمة المرور',
              isObsecure: true,
              isSuffixIconVisable: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
            ),
            const AlreadyHaveAnAccount(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
