import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
        
        clipBehavior: Clip.none,
          children: [
        
            Center(
              child: ClipRRect(
                child: SizedBox(
                  width: 435.w,
                  height: 435.h,
                  child: SvgPicture.asset("assets/images/onboarding_background.svg" , fit: BoxFit.cover,),
                ),
              ),
            ),
        
            // Center(child: Container(
            //
            //     height: 443.h,
            //     width: 443.w,
            //     child: SvgPicture.asset("assets/images/onboarding_background.svg" ,))),
        
            Center(
              child: SvgPicture.asset("splash_icon.svg" ,height: 72.h, width: 268.w,),
            ),
        
          ],
        ),
      ),
    );
  }
}
