import 'package:booking/Core/constants/app_colors.dart';
import 'package:booking/Core/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PassowrdValidations extends StatelessWidget {
  PassowrdValidations({
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  bool hasLowerCase;
  bool hasUpperCase;
  bool hasSpecialCharacters;
  bool hasNumber;
  bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowerCase letter ", hasLowerCase),
        Gap(2.h),
        buildValidationRow("At least 1 upperCase letter ", hasUpperCase),
        Gap(2.h),
        buildValidationRow(
          "at least 1 special character ",
          hasSpecialCharacters,
        ),
        Gap(2.h),
        buildValidationRow("at least 1 number  ", hasNumber),
        Gap(2.h),
        buildValidationRow("at least 8 characters long ", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: CupertinoColors.darkBackgroundGray),
        Gap(6.w),
        Text(
          text,
          style: TextStyles.regular13.copyWith(
            color:
                hasValidated ? CupertinoColors.systemGrey  : CupertinoColors.darkBackgroundGray,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
