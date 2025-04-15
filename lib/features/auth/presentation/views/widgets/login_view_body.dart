import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_media_auth_method_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 33),
              child: CustomButton(text: 'تسجيل دخول', onPressed: () {}),
            ),
            const DontHaveAnAccount(),
            const SizedBox(height: 33),
            const OrWidget(),
            const SizedBox(height: 16),
            SocialMediaAuthMethodWidget(
              text: 'تسجيل بواسطة جوجل',
              onPressed: () {},
              iconImage: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),
            SocialMediaAuthMethodWidget(
              text: 'تسجيل بواسطة أبل',
              onPressed: () {},
              iconImage: Assets.imagesAppleIcon,
            ),
            const SizedBox(height: 16),
            SocialMediaAuthMethodWidget(
              text: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
              iconImage: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
