import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:yoko_testwork/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthorizationServices authServices;

  AuthBloc({required this.authServices}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        emit(LoginLoading());
        if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
          var res = await authServices.login(
            email: event.email.trim(),
            password: event.password.trim(),
          );
          if (res['successful']) {
            var box = Hive.box('tokens');
            await box.put('accessToken', res['message']['accessToken']);
            await box.put('refreshToken', res['message']['refreshToken']);
            emit(LoginSuccessful());
          } else {
            emit(LoginUnsuccessful(errorMessage: res['message']));
          }
        } else {
          emit(LoginUnsuccessful(errorMessage: 'Заполните все поля'));
        }
      }
    });
  }
}
