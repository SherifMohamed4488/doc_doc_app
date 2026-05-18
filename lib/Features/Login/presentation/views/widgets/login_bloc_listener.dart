import 'package:booking/Core/constants/textStyles.dart';
import 'package:booking/Core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/routing/my_routes.dart';
import '../../view_model/login_cubit/login_cubit.dart';
import '../../view_model/login_cubit/login_states.dart';



class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit , LoginStates>(
   listenWhen: (previous, current) => current is Loading  || current is Success || current is Error,

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
       success: (LoginResponse){

         context.pop();
         context.pushNamed(MyRoutes.homeView);


       },
       error: (error){

         setUpErrorDialog(context, error);

       },

     );
        },

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(),
        ),
    );
  }

  void setUpErrorDialog(BuildContext context, String error) {
      context.pop();

    showDialog(

        context: context,
        builder: (context) => AlertDialog(
actionsPadding: EdgeInsets.zero,
          icon: Icon(Icons.error , color: Colors.red, size: 32.sp,),
          content: Text(error , style: TextStyles.regular14.copyWith(color: Colors.black54),),
          actions: [

            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(onPressed: (){

                context.pop();
                },
                  child: Text("Got it" ,

                    style: TextStyles.regular16.copyWith( color: AppColors.PrimaryColor),
                  )

              ),
            ),


          ],

        )
    );
  }
}
