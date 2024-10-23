import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeviceUtils {
  // 屏幕宽度
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.95;
  }
  // 检测是否为大屏设备
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  // 检测是否为移动设备
  static bool isMobile(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS;
  }

  // 检测是否为web端
  static bool isWeb(BuildContext context) {
    return kIsWeb;
  }

  // 获取屏幕尺寸
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // 返回屏幕亮度信息
  static String getScreenBrightness() {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness
        .toString();
  }

  // 获取屏幕方向
  static Orientation getDeviceOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  // 检测是否为暗黑模式
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
