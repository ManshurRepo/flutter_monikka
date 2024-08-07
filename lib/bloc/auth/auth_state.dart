
// part of 'auth_bloc.dart';

// abstract class AuthState {}

// class AuthStateLogin extends AuthState {
//   final String idToken;

//   AuthStateLogin(this.idToken);
// }

// class AuthStateLogout extends AuthState {}

// class AuthStateLoading extends AuthState {}

// class AuthStateError extends AuthState {
//   final String message;

//   AuthStateError(this.message);
// }

// class AuthStateRegisterSuccess extends AuthState {
//   final String idToken;

//   AuthStateRegisterSuccess(this.idToken);
// }
part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthStateLogin extends AuthState {
  final String idToken;

  AuthStateLogin(this.idToken);
}

class AuthStateLogout extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message);
}

class AuthStateRegisterSuccess extends AuthState {}

class AuthStateEmailNotVerified extends AuthState {}
