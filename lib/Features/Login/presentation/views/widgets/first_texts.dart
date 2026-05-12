import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/constants/textStyles.dart';

class FirstTexts extends StatelessWidget {
   FirstTexts({ required this.text1 ,  required this.text2});

  String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyles.bold24.copyWith(
            color: AppColors.PrimaryColor,
            height: 1.50,
            letterSpacing: -0.48,
          ),),
        Gap(8.h),

        Text(
          text2,
          style: TextStyles.regular14.copyWith(
            color: AppColors.PrimaryGrey,
            height: 1.80,
            letterSpacing: 0.20,
          ),),
      ],
    );
  }
}
