import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';

class LoginViewBodyBlocListener extends StatelessWidget {
  const LoginViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showErrorBar(context, message: 'تم تسجيل الدخول بنجاح');
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else if (state is SignInFailure) {
          showErrorBar(context, message: 'حدث خطأ ما');
        }
      },
      child: const LoginViewBody(),
    );
  }
}
