

// part of 'auth_bloc.dart';

// abstract class AuthEvent {}

// class AuthEventLogin extends AuthEvent {
//   final String email;
//   final String password;

//   AuthEventLogin(this.email, this.password);
// }

// class AuthEventLogout extends AuthEvent {}

// class AuthEventRegister extends AuthEvent {
//   final String email;
//   final String password;

//   AuthEventRegister(this.email, this.password);
// }

part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;

  AuthEventLogin(this.email, this.password);
}

class AuthEventLogout extends AuthEvent {}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;

  AuthEventRegister(this.email, this.password);
}
