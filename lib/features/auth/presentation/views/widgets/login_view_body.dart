import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.isSuffixIconVisable = false,
    this.isObsecure = false,
    this.keyboardType,
  });
  final String text;
  final bool isSuffixIconVisable;
  final bool isObsecure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon:
            isSuffixIconVisable
                ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffC9CECF),
                  ),
                )
                : null,
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

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'لا تمتلك حساب؟',
            style: AppTextStyles.semiBold16,
          ),
          TextSpan(
            text: ' قم بأنشاء حساب',
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Color(0xffDDDFDF))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('أو'),
        ),
        Expanded(child: Divider(thickness: 1, color: Color(0xffDDDFDF))),
      ],
    );
  }
}

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
