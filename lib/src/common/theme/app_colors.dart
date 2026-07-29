import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';

class AppColors {
  static bool get _isDark => ThemeController.instance.isDark;

  static Color get text => _isDark ? Color(0xffffffff) : Color(0xff222222);
  static Color get card => _isDark ? Color(0xFF111827) : Color(0xffbcdfec);
  static Color get dialog => _isDark ? Color(0xFF111827) : Color(0xffffffff);
  static Color get chip => _isDark ? Color(0xFF1F2937) : Color(0xffb4c8d2);
  static Color get chipText => _isDark ? Color(0xffffffff) : Color(0xff092b38);
  static Color get primary => Color(0xff2f9db6);
  static Color get background =>
      _isDark ? Color(0xff080A0C) : Color(0xfffafafa);
  static Color get border => _isDark ? Color(0xFF1F2937) : Color(0xff858585);
  static Color get errorBorder => Color.fromARGB(255, 240, 41, 41);

  static Color get secText => _isDark ? Color(0xffbcbcbc) : Color(0xff858585);

  static Color get grey => _isDark ? Colors.transparent : Colors.grey;
  static Color get subtext => _isDark ? Colors.grey : Colors.black;
  static Color get secCard => _isDark ? Color(0xff0F1115) : Color(0xfffafafa);
  static Color get secChip => _isDark ? Color(0xff0F1115) : Color(0xfffafafa);
  static Color get white => _isDark ? Color(0xffffffff) : Color(0xff222222);
  static Color get secChipText =>
      _isDark ? Color(0xff7fd4ec) : Color(0xff216579);
  static Color get secondary => _isDark ? Color(0xff080A0C) : Color(0xfffafafa);
  static Color get secBackground =>
      _isDark ? Color(0xff080A0C) : Color(0xfffafafa);
  static Color get secBorder => _isDark ? Color(0xffffffff) : Color(0xff000000);
  static Color get secShadow => _isDark ? Color(0xff000000) : Color(0xfffafafa);
  static Color get blackwhite =>
      _isDark ? Color(0xffffffff) : Color(0xffffffff);
  static Color get secBorders =>
      _isDark ? Color(0xff000000) : Color(0xffffffff);
  static Color get kBg => _isDark ? Color(0xff080A0C) : Color(0xffffffff);
  static Color get kCard => _isDark ? Color(0xFF111827) : Color(0xffffffff);
  static Color get kTile => _isDark ? Color(0xFF0F1115) : Color(0xffffffff);
  static Color get kBorder =>
      _isDark ? const Color(0xFF1F2937) : const Color(0xFF1F2937);

  static Color get shadow => _isDark
      ? Color(0xff000000).withValues(alpha: 0.2)
      : const Color(0x14000000); // ~8% black
  static Color get kGreen =>
      _isDark ? Color(0xFF22C55E) : Color.fromARGB(255, 16, 189, 77);
  static Color get heroCard => _isDark ? Color(0xff091B38) : Color(0xffE8F3F7);
  static Color get kInputFill =>
      _isDark ? Color(0xff2C2C2C) : Color(0xffF0F2F5);
  static Color get onGreenButton => Color(
    0xff000000,
  ); // stays dark for contrast on the green button in both themes
}
