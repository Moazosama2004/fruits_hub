import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showErrorBar(context, message: 'تم انشاء حساب جديد');
        } else if (state is SignupFailure) {
          showErrorBar(context, message: state.errMessage);
        }
      },
      child: const SignUpViewBody(),
    );
  }
}
