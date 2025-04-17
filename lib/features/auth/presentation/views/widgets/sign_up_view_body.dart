import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String name, email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObsecure = true;
  bool isTermsAndConditionsAccepted = false;

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<SignupCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: khorizitalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (data) {
                  name = data!;
                },
                text: 'الاسم كامل',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
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
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAndConditionsAccepted = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    if (state is SignupLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return CustomButton(
                      text: 'إنشاء حساب جديد',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (isTermsAndConditionsAccepted) {
                            context
                                .read<SignupCubit>()
                                .createUserWithEmailAndPassword(
                                  name: name,
                                  email: email,
                                  password: password,
                                );
                          } else {
                            showErrorBar(
                              context,
                              message: 'يجب عليك الموافقه علي الشروط و الاحكام',
                            );
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    );
                  },
                ),
              ),
              const AlreadyHaveAnAccount(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
