import 'package:booking/Features/SignUp/presentation/view_model/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Shared/custom_text_field.dart';
import '../../../../Login/presentation/views/widgets/app_regex.dart';
import '../../../../Login/presentation/views/widgets/passowrd_validations.dart';

class EmailAndPassword2 extends StatefulWidget {
  const EmailAndPassword2({super.key});

  @override
  State<EmailAndPassword2> createState() =>
      _EmailAndPassword2State();
}

class _EmailAndPassword2State
    extends State<EmailAndPassword2> {

  bool isObsecure = true;

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  late VoidCallback passwordListener;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignUpCubit>();

    passwordController = cubit.passwordController;

    confirmPasswordController =
        cubit.passwrodConfirmationController;

    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {

    passwordListener = () {

      if (!mounted) return;

      setState(() {

        hasLowerCase =
            AppRegex.hasLowerCase(
              passwordController.text,
            );

        hasUpperCase =
            AppRegex.hasUpperCase(
              passwordController.text,
            );

        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(
              passwordController.text,
            );

        hasNumber =
            AppRegex.hasNumber(
              passwordController.text,
            );

        hasMinLength =
            AppRegex.hasMinLength(
              passwordController.text,
            );
      });
    };

    passwordController.addListener(passwordListener);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return Column(
      children: [

        Column(
          children: [

            CustomTextField(
              controller: cubit.nameController,
              hintText: "Name",
              textInputType: TextInputType.name,

              onSaved: (value) {},

              validator: (value) {

                if (value == null || value.isEmpty) {
                  return "Required field";
                }
                if (!AppRegex.isNameValid(value)) {

                  return "Name must be at least 3 characters";
                }

                return null;
              },
            ),

            Gap(16.h),

            CustomTextField(
              controller: cubit.phoneController,
              hintText: "Phone number",
              textInputType: TextInputType.phone,

              onSaved: (value) {},

              validator: (value) {
                if (value == null || value.isEmpty ){

                  return "Required field";
                }
                if (
                    !AppRegex.isEgyptPhoneValid(value)) {

                  return "Invalid phone number";
                }

                return null;
              },
            ),

            Gap(16.h),

            CustomTextField(
              controller: cubit.emailController,
              hintText: "Email",
              textInputType:
              TextInputType.emailAddress,

              onSaved: (value) {},

              validator: (value) {

                if (value == null || value.isEmpty ){

                  return "Required field";
                }
                if (!AppRegex.isEmailValid(value)) {
                  return "Invalid email";
                }

                return null;
              },
            ),

            Gap(16.h),

            CustomTextField(
              controller: passwordController,

              hintText: "Password",

              textInputType:
              TextInputType.visiblePassword,

              isObsecure: isObsecure,

              onSaved: (value) {},

              validator: (value) {

                if (value == null || value.isEmpty ){

                  return "Required field";
                }
                if (!AppRegex.isPasswordValid(value)) {
                  return "Invalid password";
                }


                return null;
              },

              suffixIcon: GestureDetector(

                onTap: () {

                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },

                child: isObsecure
                    ? const Icon(
                  CupertinoIcons.eye_slash_fill,
                  color: Color(0xffC9CECF),
                )
                    : const Icon(
                  CupertinoIcons.eye_fill,
                  color: Color(0xffC9CECF),
                ),
              ),
            ),

            Gap(16.h),

            CustomTextField(

              controller:
              confirmPasswordController,

              hintText: "Password confirmation",

              textInputType:
              TextInputType.visiblePassword,

              isObsecure: isObsecure,

              onSaved: (value) {},

              validator: (value) {

                if (value == null || value.isEmpty) {
                  return "Required field";
                }

                if (value !=
                    passwordController.text) {

                  return "Passwords do not match";
                }

                return null;
              },

              suffixIcon: GestureDetector(

                onTap: () {

                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },

                child: isObsecure
                    ? const Icon(
                  CupertinoIcons.eye_slash_fill,
                  color: Color(0xffC9CECF),
                )
                    : const Icon(
                  CupertinoIcons.eye_fill,
                  color: Color(0xffC9CECF),
                ),
              ),
            ),
          ],
        ),

        Gap(24.h),

        PassowrdValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacters:
          hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }

  @override
  void dispose() {

    passwordController
        .removeListener(passwordListener);

    super.dispose();
  }
}