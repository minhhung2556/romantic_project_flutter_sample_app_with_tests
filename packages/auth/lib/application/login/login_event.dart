part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventValidate extends LoginEvent {
  final String userName;

  LoginEventValidate({
    required this.userName,
  });
}

class LoginEventSubmit extends LoginEvent {
  final String userName;

  LoginEventSubmit({
    required this.userName,
  });
}
