import 'package:booking/Core/di/dependency_injection.dart';
import 'package:booking/core/constants/app_colors.dart';
import 'package:booking/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_routing.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(375, 812), // Base design size (from your Figma etc.)
      minTextAdapt: true,
      splitScreenMode: true,

      builder:
          (_, __) => MaterialApp(


            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              fontFamily: "Inter",
              primaryColor: AppColors.PrimaryColor,
              scaffoldBackgroundColor: Colors.white,
              // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.PrimaryColor),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            onGenerateRoute: onGenerateRoute,
            initialRoute: MyRoutes.signUpView,

          ),

    );
  }
}

