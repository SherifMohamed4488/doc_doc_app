import 'package:booking/Features/Splash/presentation/views/splash_view.dart';
import 'package:booking/core/routing/routes.dart';
import 'package:booking/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

import '../../Features/OnBoarding/presentation/views/onBoardingView.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case MyRoutes.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case MyRoutes.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case MyRoutes.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}