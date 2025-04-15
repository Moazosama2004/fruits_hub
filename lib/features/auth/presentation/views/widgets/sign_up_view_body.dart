import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_check_box.dart';

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

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟',
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
            text: ' تسجيل دخول',
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (bool value) {
            isTermsAccepted = value;
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                  text: ' الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
