import 'package:booking/core/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text(
      'Best Doctor Appointment App',
      textAlign: TextAlign.center,
      style: TextStyles.bold32.copyWith(      
        color: const Color(0xFF247CFF),
        height: 1.50
      )),

        Gap(18.h),

        SizedBox(
          width: 340.w,
          child: Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,
            style: TextStyles.regular12.copyWith(
              height: 1.50,
              color: const Color(0xFF757575),
            )
          ),
        )
      ]
    );
  }
}
