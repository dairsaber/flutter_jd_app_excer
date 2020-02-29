import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(context, {int height = 1334, int width = 750}) {
    ScreenUtil.init(context, height: height, width: width);
  }

  static double width(double width) {
    return ScreenUtil().setWidth(width);
  }

  static double height(double height) {
    return ScreenUtil().setHeight(height);
  }
}
