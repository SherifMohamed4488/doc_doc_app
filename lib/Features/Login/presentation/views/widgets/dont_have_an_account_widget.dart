import 'package:booking/Core/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
   DontHaveAnAccountWidget({ required this.text1, required this.textButton , required this.onTap});

  String text1 , textButton;
  VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric( horizontal: 52.w),
      child: Row(

        children: [



        Text(
         text1,
        style: TextStyles.regular12.copyWith(

          color: const Color(0xFF242424),
          height: 1.50
        )
      ),
          Gap(2.w),
          GestureDetector(
            onTap: onTap,
            child: Text(
                textButton,
                style: TextStyles.semiBold12.copyWith(
                    color: const Color(0xFF247CFF),
                    height: 1.50
                )
            ),
          ),



      ]
      ),
    );






  }
}
