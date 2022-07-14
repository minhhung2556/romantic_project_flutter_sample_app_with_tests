import 'package:common/common.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateInitial()) {
    on<LoginEventValidate>((event, emit) {
      if (event.userName.length > 2) {
        emit(LoginStateValid(userName: event.userName));
      } else {
        emit(LoginStateInvalid(errorMessage: 'Invalid user name!'));
      }
    });
    on<LoginEventSubmit>((event, emit) async {
      if (state is LoginStateValid) {
        emit(LoginStateLoading());
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(LoginStateDoneSubmitting());
      }
    });
  }
}
