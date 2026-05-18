import 'package:booking/Core/helpers/extensions.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_cubit.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Core/routing/my_routes.dart';


class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit , SignUpStates>(
      listenWhen: (previous, current) => current is SignUpLoading  || current is SignUpSuccess || current is SignUpError,

      listener: (context , state){

        state.whenOrNull(

          loading: (){

            showDialog(
                context: context,
                builder: (context) =>  Center(
                  child: CircularProgressIndicator(
                    color: AppColors.PrimaryColor,
                  ),
                )
            );

          },
          success: (SignUpResponse){

           setUpSuccessDialog(context, "Congratulations,you have signed up successfully!");

          },
          error: (error){

            if (Navigator.canPop(context)) {
              context.pop();
            }

            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(error),
            );

          },

        );
      },

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(),
      ),
    );
  }

  void setUpSuccessDialog(BuildContext context, String message ) {
    context.pop();

    showDialog(

        context: context,

        builder: (context) => AlertDialog(
          actionsPadding: EdgeInsets.zero,
          icon: Icon(
            Icons.check_circle_outline,
            color: CupertinoColors.systemGreen,
            size: 30.sp,
          ),

          content: Text(message , style: TextStyles.regular14.copyWith(color: Colors.black54),),
          actions: [

            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(onPressed: (){

                context.pushNamed(MyRoutes.loginView);

              },
                  child: Text("Continue" ,

                    style: TextStyles.regular16.copyWith( color: AppColors.PrimaryColor),
                  )

              ),
            ),


          ],

        )
    );
  }

  SnackBar customSnackBar(String errMsg ) {
    return SnackBar(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      clipBehavior: Clip.none,
      backgroundColor:  Colors.red.shade700,
      content: Row(
        children: [
          Icon(CupertinoIcons.info, color: Colors.white),
          Gap(14.w),

          Expanded(
            child: Text(
              errMsg,
              style: TextStyles.regular16.copyWith(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Text(
          //   errMsg,
          //   style: Styles.style16InterRegular.copyWith(color: Colors.white),
          // ),
        ],
      ),
    );
  }

}
