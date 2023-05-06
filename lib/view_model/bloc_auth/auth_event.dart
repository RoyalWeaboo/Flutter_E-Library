import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetSession extends AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;

  const Login(this.email, this.password);
}

class Register extends AuthEvent {
  final String email;
  final String password;

  const Register(this.email, this.password);
}

class Logout extends AuthEvent {}
