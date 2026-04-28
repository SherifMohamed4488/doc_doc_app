import 'package:booking/Core/constants/app_colors.dart';
import 'package:booking/Core/constants/textStyles.dart';
import 'package:booking/Features/Login/presentation/views/widgets/or_widget.dart';
import 'package:booking/Shared/custom_button.dart';
import 'package:booking/Shared/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatefulWidget {
   LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
   bool isObsecure = false;

  final GlobalKey<FormState> formKey = GlobalKey();

   AutovalidateMode autoVlidateMode = AutovalidateMode.disabled;

   late String email ,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding:  EdgeInsets.all(16),
            child: Form(
              key: formKey,
              autovalidateMode: autoVlidateMode,
              child: Column(
                children: [

                Text(
                'Create Account',
                style: TextStyles.bold24.copyWith(
                  color: AppColors.PrimaryColor,
                  height: 1.50,
                  letterSpacing: -0.48,
                ),),
              Gap(8.h),

              Text(
                  'Sign up now and start exploring all that our app has to offer. We are excited to welcome you to our community!',
                  style: TextStyles.regular14.copyWith(
                    color: AppColors.PrimaryGrey,
                    height: 1.80,
                    letterSpacing: 0.20,
                  ),),

                  Gap(17.h),

CustomTextField(hintText: "Email", textInputType: TextInputType.emailAddress, onSaved: (value){} ),
                  Gap(16.h),
                  CustomTextField(hintText: "Password", textInputType: TextInputType.visiblePassword, onSaved: (value){} ,

                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() => isObsecure = ! isObsecure);
                        },
                        child: isObsecure ?  Icon(CupertinoIcons.eye_slash_fill , color: Color(0xffC9CECF),) :Icon(CupertinoIcons.eye_fill , color: Color(0xffC9CECF),)),


                    isObsecure: isObsecure, 
                  ),
                  
                  Gap(32.h),
                  
                  CustomButton(text: "Create Account"),
                  Gap(46.h),
                  OrWidget(),
                  Gap(32.h),
                  
                  Gap(24.h)
                  




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
