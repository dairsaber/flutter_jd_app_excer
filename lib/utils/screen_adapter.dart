import 'package:flutter_screenutil/flutter_screenutil.dart';

// 屏幕适配算法
class ScreenAdapter {
  static final _screenDesignWidth = 750;
  static final _screenDesignHeight = 1334;
  //暴露两个只读属性
  static int get screenDesignHeight => _screenDesignHeight;
  static int get screeDesignWidth => _screenDesignWidth;

  static init(context, {int height = 1334, int width = 750}) {
    ScreenUtil.init(context, height: height, width: width);
  }

  //获得当前计算后的屏幕高度
  static double width(double width) {
    return ScreenUtil().setWidth(width);
  }

  //获得当前计算后的屏幕高度
  static double height(double height) {
    return ScreenUtil().setHeight(height);
  }

  // 获取当前计算内容宽度
  static double getContentWidth(int contentNum,
      {double lrPadding = 0.0, double containerWidth, double gutter}) {
    final currentGutter = gutter ?? lrPadding;
    final currentContainerWidth = containerWidth ?? _screenDesignWidth;
    final contentDesignWidth = (currentContainerWidth -
            lrPadding * 2 -
            (contentNum - 1) * currentGutter) /
        contentNum;
    return width(contentDesignWidth);
  }
}
