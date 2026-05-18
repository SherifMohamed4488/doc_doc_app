import 'package:booking/Core/helpers/extensions.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_cubit.dart';
import 'package:booking/Features/SignUp/presentation/views/widgets/already_have_an_account_widget.dart';
import 'package:booking/Features/SignUp/presentation/views/widgets/email_and_password_2.dart';
import 'package:booking/Features/SignUp/presentation/views/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Shared/custom_button.dart';
import '../../../../Login/presentation/view_model/login_cubit/login_cubit.dart';
import '../../../../Login/presentation/views/widgets/dont_have_an_account_widget.dart';
import '../../../../Login/presentation/views/widgets/email_and_password.dart';
import '../../../../Login/presentation/views/widgets/first_texts.dart';
import '../../../../Login/presentation/views/widgets/terms_and_conditions_text.dart';

class SignUpViewBody extends StatelessWidget {
   SignUpViewBody({super.key});
   // final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoVlidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),

            child: Form(
              key:context.read<SignUpCubit>().formKey ,
              autovalidateMode: autoVlidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Gap(20.h),
                  FirstTexts(
                    text1: "Create Account",
                    text2:
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  ),

                  Gap(17.h),

                  EmailAndPassword2(),

                  Gap(8.h),



                  Gap(32.h),

                  CustomButton(text: "Sign up" , onTap: (){
                    validateThenSignUp(context);

                  },),
                  // Gap(46.h),
                  // OrWidget(),
                  Gap(16.h),

                  TermsAndConditionsText(),

                  Gap(24.h),
                 AlreadyHaveAnAccountWidget(
                   text1: "Already have an account? ",
                   textButton: "Log In",
                   onTap: (){

context.pop();
                   },
                 ),
                  Gap(24.h),

                  SignUpBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void validateThenSignUp(BuildContext context){

     if(context.read<SignUpCubit>().formKey.currentState!.validate()){

       context.read<SignUpCubit>().emitSignUpStates();

     }
   }
}
