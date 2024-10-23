import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 用户信息存储 key
const String userInfoKey = 'user_info';

class UserInfo {
  /// 登录类型
  String? loginType;

  /// 登录账号
  String? account;

  /// 是否已登陆
  bool isLogin;

  /// 头像 URL
  String? avatarUrl;

  /// 手机号码
  String? phoneNumber;

  /// 邮箱账号
  String? email;

  /// 生日
  DateTime? birthday;

  /// 星座
  String? constellation;

  /// 所在地
  String? location;

  /// 注册国家
  String? registeredCountry;

  UserInfo({
    this.loginType,
    this.account,
    this.isLogin = false,
    this.avatarUrl,
    this.phoneNumber,
    this.email,
    this.birthday,
    this.constellation,
    this.location,
    this.registeredCountry,
  });

  Map<String, dynamic> toJson() {
    return {
      'loginType': loginType,
      'account': account,
      'isLogin': isLogin,
      'avatarUrl': avatarUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      'birthday': birthday?.toIso8601String(),
      'constellation': constellation,
      'location': location,
      'registeredCountry': registeredCountry,
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      loginType: json['loginType'],
      account: json['account'],
      isLogin: json['isLogin'],
      avatarUrl: json['avatarUrl'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      constellation: json['constellation'],
      location: json['location'],
      registeredCountry: json['registeredCountry'],
    );
  }

  @override
  String toString() {
    return '登录类型: $loginType, 登录账号: $account, 是否已登陆: $isLogin, 头像 URL: $avatarUrl, 手机号码: $phoneNumber, 邮箱账号: $email, 生日: $birthday, 星座: $constellation, 所在地: $location, 注册国家: $registeredCountry';
  }
}

class UserStorage {
  static Future<void> saveUserInfo(UserInfo userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userInfoKey, jsonEncode(userInfo.toJson()));
  }

  static Future<UserInfo?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(userInfoKey);
    if (jsonString != null) {
      return UserInfo.fromJson(jsonDecode(jsonString));
    }
    return UserInfo(
      loginType: '',
      account: '',
      isLogin: false,
      avatarUrl:
          'https://pic1.zhimg.com/80/v2-3a6e134166a08b6e4600ebf02dd50298_1440w.webp',
      phoneNumber: '',
      email: '',
      birthday: null,
      constellation: '',
      location: '',
      registeredCountry: '中国',
    );
  }

  static Future<void> updateUserInfoField(
      String fieldName, dynamic value) async {
    final userInfo = await getUserInfo();
    if (userInfo != null) {
      switch (fieldName) {
        case 'loginType':
          userInfo.loginType = value as String?;
          break;
        case 'account':
          userInfo.account = value as String?;
          break;
        case 'isLogin':
          userInfo.isLogin = value as bool;
          break;
        case 'avatarUrl':
          userInfo.avatarUrl = value as String?;
          break;
        case 'phoneNumber':
          userInfo.phoneNumber = value as String?;
          break;
        case 'email':
          userInfo.email = value as String?;
          break;
        case 'birthday':
          userInfo.birthday = value as DateTime?;
          break;
        case 'constellation':
          userInfo.constellation = value as String?;
          break;
        case 'location':
          userInfo.location = value as String?;
          break;
        case 'registeredCountry':
          userInfo.registeredCountry = value as String?;
          break;
      }
      await saveUserInfo(userInfo);
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userInfoKey);
  }
}
