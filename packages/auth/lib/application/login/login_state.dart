part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateValid extends LoginState {
  final String userName;

  LoginStateValid({
    required this.userName,
  });
}

class LoginStateInvalid extends LoginState {
  final String errorMessage;

  LoginStateInvalid({
    required this.errorMessage,
  });
}

class LoginStateLoading extends LoginState {}

class LoginStateDoneSubmitting extends LoginState {}
