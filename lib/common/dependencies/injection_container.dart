import 'package:get_it/get_it.dart';
import 'package:yoko_testwork/common/dio/my_dio.dart';
import 'package:yoko_testwork/services/auth_services.dart';

GetIt getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<MyDio>(MyDio());

  getIt.registerSingleton<AuthorizationServices>(
      AuthorizationImplServices(myDio: getIt<MyDio>()));
}
