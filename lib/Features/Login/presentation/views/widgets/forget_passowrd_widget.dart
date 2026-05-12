import 'package:booking/Core/constants/app_colors.dart';
import 'package:booking/Core/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassowrdWidget extends StatelessWidget {
  const ForgetPassowrdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Forgot Password?',
      style: TextStyles.regular12.copyWith(

        color: AppColors.PrimaryColor,
        height: 1.50,
      )
    );
  }
}
