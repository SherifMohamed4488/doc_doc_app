import 'package:booking/Features/Login/presentation/views/widgets/app_regex.dart';
import 'package:booking/Features/Login/presentation/views/widgets/passowrd_validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Shared/custom_text_field.dart';
import '../../view_model/login_cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  // final GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecure = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    // TODO: implement initState

    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener((){
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);

      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CustomTextField(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {},
              validator: (value){

                if( value == null || value.isEmpty || !AppRegex.isEmailValid(value))  {
                  return "required field ";
                }
                return null;

              },
            ),
            Gap(16.h),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              onSaved: (value) {},
    validator: (value){

      if( value == null || value.isEmpty || !AppRegex.isPasswordValid(value))  {
        return "required field ";
      }
      return null;

    },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() => isObsecure = !isObsecure);
                },
                child:
                    isObsecure
                        ? Icon(
                          CupertinoIcons.eye_slash_fill,
                          color: Color(0xffC9CECF),
                        )
                        : Icon(
                          CupertinoIcons.eye_fill,
                          color: Color(0xffC9CECF),
                        ),
              ),

              isObsecure: isObsecure,
            ),
          ],
        ),

        Gap(24.h),
        PassowrdValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
  }
}
