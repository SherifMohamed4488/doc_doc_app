import 'package:booking/Core/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.text });

  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(

          width: 316.w,
          height: 52.5.h,
          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: ShapeDecoration(
              color: const Color(0xFF247CFF),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFF247CFF),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
      ),

        child: Center(
          child: Text(
            text ,
            style:  TextStyles.semiBold16.copyWith(color: Colors.white, height: 1.50),

          ),
        ),
      ),
    );
  }
}
