import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 登录信息key
const String loginInfoKey = 'login_info';

class LoginInfo {
  /// 登录类型
  final String? type;

  /// 登录账号
  final String? content;

  /// 是否已登陆
  final bool isLogin;

  LoginInfo({this.type, this.content, this.isLogin = false});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'content': content,
      'isLogin': isLogin,
    };
  }

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      type: json['type'],
      content: json['content'],
      isLogin: json['isLogin'],
    );
  }
  @override
  String toString() {
    return '登录类型: $type, 登录账号: $content, 是否已登陆: $isLogin';
  }
}

class LoginStorage {
  static Future<void> saveLoginInfo(LoginInfo loginInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginInfoKey, jsonEncode(loginInfo.toJson()));
  }

  static Future<LoginInfo?> getLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(loginInfoKey);
    if (jsonString != null) {
      return LoginInfo.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginInfoKey);
  }
}
