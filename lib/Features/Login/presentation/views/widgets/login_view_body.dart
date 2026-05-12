import 'package:booking/Features/Login/data/models/login_request_body.dart';
import 'package:booking/Features/Login/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:booking/Features/Login/presentation/views/widgets/email_and_password.dart';
import 'package:booking/Features/Login/presentation/views/widgets/first_texts.dart';
import 'package:booking/Features/Login/presentation/views/widgets/forget_passowrd_widget.dart';
import 'package:booking/Features/Login/presentation/views/widgets/login_bloc_listener.dart';
import 'package:booking/Features/Login/presentation/views/widgets/terms_and_conditions_text.dart';
import 'package:booking/Shared/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../view_model/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObsecure = false;

  // final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoVlidateMode = AutovalidateMode.disabled;

  // late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: Form(
              key: context.read<LoginCubit>().formKey,
              autovalidateMode: autoVlidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Gap(50.h),
                  FirstTexts(
                    text1: "Welcome Back",
                    text2:
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  ),

                  Gap(17.h),

                  EmailAndPassword(),

                  Gap(8.h),

                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: ForgetPassowrdWidget(),
                  ),

                  Gap(32.h),

                  CustomButton(text: "Login" , onTap: (){validateThenLogin(context);},),
                  // Gap(46.h),
                  // OrWidget(),
                  Gap(16.h),

                  TermsAndConditionsText(),

                  Gap(24.h),
                  DontHaveAnAccountWidget( text1: "Already have an account yet?", textButton: "Sign Up", onTap: (){},),
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context){

    if(context.read<LoginCubit>().formKey.currentState!.validate()){

      context.read<LoginCubit>().emitLoginStates(
          LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
      )
      );

    }
  }
}
