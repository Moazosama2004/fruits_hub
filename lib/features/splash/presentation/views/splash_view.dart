import 'package:flutter/material.dart';
import 'package:fruits_hub/config/cache_helper/cache_helper.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = 'splashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 5), () {
      if (CacheHelper.getBool(key: kIsOnBoardingVisited) ?? false) {
        Navigator.of(context).pushReplacementNamed(SigninView.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
      }
    });
  }
}
