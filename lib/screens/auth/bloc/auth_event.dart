part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  Login({required this.email, required this.password});
  final String email;
  final String password;
}
