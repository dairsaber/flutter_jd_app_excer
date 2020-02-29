import 'package:flutter_screenutil/flutter_screenutil.dart';

initPage(context, {int height = 1334, int width = 750}) {
  ScreenUtil.init(context, height: height, width: width);
}

num setWidth(num width) {
  return ScreenUtil().setWidth(width);
}

num setHeight(num height) {
  return ScreenUtil().setHeight(height);
}
