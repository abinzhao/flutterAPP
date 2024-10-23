// import 'package:dio/dio.dart';
import '../../storage/user.dart';

Future<dynamic> sendPostRequest(dynamic data) async {
  try {
    // Dio dio = Dio();
    // final response = await dio.post(
    //   'https://api.example.com/submit',
    //   data: data ?? {},
    // );
    await UserStorage.updateUserInfoField(
        'loginType', data["selectedData"]['value']);
    await UserStorage.updateUserInfoField('account', data["account"]);
    await UserStorage.updateUserInfoField('isLogin', true);
    final userInfo = await UserStorage.getUserInfo();
    return userInfo;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
