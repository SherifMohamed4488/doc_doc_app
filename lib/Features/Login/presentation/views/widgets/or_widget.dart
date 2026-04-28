import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/textStyles.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(
        )),
        SizedBox(width: 8.w,),
        Text(
            'Or sign in with',
            style:TextStyles.regular13.copyWith(height: 1.50 ,
    color: const Color(0xFF9E9E9E)
        )),

        SizedBox(width: 8.w,),


        Expanded(child: Divider(
        )),
      ],
    );
  }
}

