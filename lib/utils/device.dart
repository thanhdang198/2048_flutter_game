import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Device {
  static getRatio(int value) {
    int uiWidth = value;
    return ScreenUtil.defaultSize.width / uiWidth;
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

  // ignore: deprecated_member_use
  static Platform platform = Platform();
}
