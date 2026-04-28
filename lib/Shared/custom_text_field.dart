import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/constants/textStyles.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.hintText, required this.textInputType, required this.onSaved ,  this.suffixIcon , this.isObsecure = false });
  String hintText;
  TextInputType textInputType;
  Widget? suffixIcon ;
  void Function(String?)? onSaved;
  bool isObsecure;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: TextStyles.regular14,
      obscureText: isObsecure,
      onSaved: onSaved,
      validator: (value){
        if(value == null || value.isEmpty)  {
          return "required field";
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
          suffixIcon: suffixIcon,
          hintText: hintText ,
          hintStyle: TextStyles.semiBold14.copyWith(
            color: const Color(0xFFC2C2C2),

              ),
          filled: true,
          fillColor: const Color(0xFFFDFDFF),

          enabledBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                  width: 1,
                  color: const Color(0xFFECECEC)
              )
          ),
          focusedBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                  width: 1,
                  color: const Color(0xFFECECEC)
              )
          )
      ),
    );;
  }
}
