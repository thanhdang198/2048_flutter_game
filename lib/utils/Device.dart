import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Device {
  static getRatio(int value) {
    int uiwidth = value is int ? value : 750;
    return ScreenUtil.defaultSize.width / uiwidth;
  }

  static getRpx(double value) {
    return value * getRatio(750);
  }

  static getBottomPadding() {
    // return ScreenUtil.defaultSize..padding.bottom;
    return 20;
  }

  static getTopPadding() {
    // return ScreenUtil.mediaQueryData.padding.top;
    return 20;
  }

  static getWidth() {
    return ScreenUtil.defaultSize.width;
  }

  static Platform platform = Platform();
}
