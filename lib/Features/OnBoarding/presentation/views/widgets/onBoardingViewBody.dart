import 'package:booking/Core/helpers/extensions.dart';
import 'package:booking/Core/routing/my_routes.dart';
import 'package:booking/Features/OnBoarding/presentation/views/widgets/text_widget.dart';
import 'package:booking/Shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OnBoardingviewbody extends StatelessWidget {
  const OnBoardingviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: Column(
            children: [
              // Gap(21.h),
              SvgPicture.asset(
                "assets/images/first onboarding_complete_icon.svg",
              ),
              Gap(40.h),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 20.w,
                      child: ClipRRect(
                        child: SizedBox(
                          width: 435.w,
                          height: 435.h,
                          child: SvgPicture.asset(
                            "assets/images/onboarding_background.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0.0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.14, 0.4],
                        ),
                      ),
                      child: Image.asset("assets/images/doctor.png"),
                    ),

                    Positioned(
                      bottom: 55.h,
                      left: 0,
                      right: 0,
                      child: TextWidget(),
                    ),


                  ],
                ),
              ),

              CustomButton(text: "Get Started" , onTap: (){
                context.pushNamed(MyRoutes.loginView);
              },),
              Gap(32.h),
            ],
          ),
        ),
      ),
    );
  }
}
