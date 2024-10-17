// import 'package:dio/dio.dart';
import 'login_utils.dart';

Future<dynamic> sendPostRequest(dynamic data) async {
  try {
    // Dio dio = Dio();
    // final response = await dio.post(
    //   'https://api.example.com/submit',
    //   data: data ?? {},
    // );
    await LoginStorage.saveLoginInfo(
      LoginInfo(
        type: data["selectedData"]['value'],
        content: data["content"],
        isLogin: true,
      ),
    );
    return '登录成功';
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
