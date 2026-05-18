import 'package:booking/Core/di/dependency_injection.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_cubit.dart';
import 'package:booking/Features/Splash/presentation/views/splash_view.dart';
import 'package:booking/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/Home/presentation/views/home_view.dart';
import '../../Features/Login/presentation/view_model/login_cubit/login_cubit.dart';
import '../../Features/OnBoarding/presentation/views/onBoardingView.dart';
import '../../Features/SignUp/presentation/views/sign_up_view.dart';
import 'my_routes.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case MyRoutes.onBoardingView:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case MyRoutes.splashView:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case MyRoutes.loginView:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginView()));
    case MyRoutes.signUpView:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const SignUpView()));

    case MyRoutes.homeView:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}