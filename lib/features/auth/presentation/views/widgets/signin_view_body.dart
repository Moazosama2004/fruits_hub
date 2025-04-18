import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_media_auth_method_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: khorizitalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (data) {
                  email = data!;
                },
                text: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (data) {
                  password = data!;
                },
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
                child: BlocBuilder<SigninCubit, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return CustomButton(
                      text: 'تسجيل دخول',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SigninCubit>()
                              .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
                  },
                ),
              ),
              const DontHaveAnAccount(),
              const SizedBox(height: 33),
              const OrWidget(),
              const SizedBox(height: 16),
              SocialMediaAuthMethodWidget(
                text: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
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
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                iconImage: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
