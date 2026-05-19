import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main.dart' as app;

Future<void> main() async {
  // To fix texts being hidden because screenutil package in release mode (release run)
  await ScreenUtil.ensureScreenSize();
  app.main();
}