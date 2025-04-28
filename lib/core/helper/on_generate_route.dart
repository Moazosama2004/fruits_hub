import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_fruits_view.dart';
import 'package:fruits_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingFruitsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BestSellingFruitsView(),
      );
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder:
            (context) =>
                CheckoutView(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
