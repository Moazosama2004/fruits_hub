import 'package:flutter/material.dart';
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
    return Scaffold(
      // appBar: ,
      body: SplashViewBody(),
    );
  }

  void excuteNavigation() {
    Future.delayed(
      Duration(seconds: 5),
      () =>
          Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName),
    );
  }
}
