import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/textStyles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( left: 4.w ),
      child: SizedBox(
        width: 270.w,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'By logging, you agree to our',
                  style: TextStyles.regular12.copyWith(height: 1.50, color: const Color(0xFF9E9E9E),
                  )
              ),
              TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyles.regular12.copyWith(height: 1.50, color: const Color(0xFF242424),
                  )

              ),
              TextSpan(
                  text: 'and',
                style: TextStyles.regular12.copyWith(height: 1.50, color: const Color(0xFF9E9E9E),

              ),),
              TextSpan(
                text: 'PrivacyPolicy.',
                style: TextStyles.regular12.copyWith(height: 1.50, color: const Color(0xFF242424),


              ),),
            ],
          ),
        ),
      ),
    );
  }
}
