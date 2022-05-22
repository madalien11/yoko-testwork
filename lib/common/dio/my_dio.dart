import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../config.dart';

class MyDio {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl))
    ..interceptors.add(DioInterceptor());

  set path(String path) => dio = Dio(BaseOptions(baseUrl: baseUrl + path))
    ..interceptors.add(DioInterceptor());
}

class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  var box = Hive.box('tokens');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('ticket-types') &&
        box.get('accessToken') != null) {
      options.headers['Authorization'] = 'Bearer ${box.get('accessToken')}';
    }
    super.onRequest(options, handler);
  }
}
