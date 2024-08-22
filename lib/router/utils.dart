import 'package:flutter/material.dart';

/// 路由服务
class RouterService {
  /// 带历史记录的跳转
  static void go(
    BuildContext context,
    String routeName,
    Object? arguments,
  ) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// 返回上一层
  static void back(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

  /// 清除历史记录的跳转
  static void replace(
    BuildContext context,
    String routeName, {
    Object? arguments
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  /// 获取路由参数
  static T? getArguments<T>(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    if (routeSettings != null && routeSettings.arguments != null) {
      return routeSettings.arguments as T;
    }
    return null;
  }
}
