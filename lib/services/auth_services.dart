import 'package:dio/dio.dart';
import 'package:yoko_testwork/common/dio/my_dio.dart';

abstract class AuthorizationServices {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
}

class AuthorizationImplServices implements AuthorizationServices {
  AuthorizationImplServices({required MyDio myDio}) {
    myDio.path = 'user-service/auth/';
    dio = myDio.dio;
  }
  late Dio dio;

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post('login', data: {
        'email': email,
        'password': password,
      });
      return {'message': response.data, 'successful': true};
    } on DioError catch (e) {
      // Handle error
      return {
        'message': e.response!.data['message'].toString(),
        'successful': false
      };
    }
  }
}
