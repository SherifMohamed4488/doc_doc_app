import 'package:booking/Core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/constants/textStyles.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.onSaved,
    required this.validator,
    this.suffixIcon,
    this.isObsecure = false,
     this.controller


  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool isObsecure;
  final String? Function(String?)? validator;

  TextEditingController? controller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          isFocused = value;
        });
      },
      child: TextFormField(
        controller: widget.controller ,
        cursorColor: AppColors.PrimaryColor,
        style: TextStyles.regular14,
        obscureText: widget.isObsecure,
        onSaved: widget.onSaved,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),

          suffixIcon: widget.suffixIcon != null
              ? IconTheme(
            data: IconThemeData(
              color: isFocused
                  ? AppColors.PrimaryColor
                  : const Color(0xFFC2C2C2),
            ),
            child: widget.suffixIcon!,
          )
              : null,

          hintText: widget.hintText,
          hintStyle: TextStyles.semiBold14.copyWith(
            color: const Color(0xFFC2C2C2),
          ),

          filled: true,
          fillColor: const Color(0xFFFDFDFF),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(
              width: 1.3,
              color: Color(0xFFECECEC),
            ),
          ),


          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.3,
              color: AppColors.PrimaryColor,
            ),

          ),


          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                width: 1.3,
                color: Colors.red,
              ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.3,
              color: Colors.red,
            ),
          ),

        ),
      ),
    );
  }
}