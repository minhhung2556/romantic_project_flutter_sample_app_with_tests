import 'package:auth/auth.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget implements RouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateDoneSubmitting) {
          Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
          ),
          body: Column(
            children: [
              const Text('This is the Login Screen'),
              if (state is LoginStateValid) const Text('Username is valid!'),
              if (state is LoginStateInvalid) const Text('Username is invalid!'),
              if (state is LoginStateLoading) const Text('Loading...'),
              TextButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginEventValidate(userName: 'hungldm'));
                },
                child: const Text('Validate'),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginEventSubmit(userName: 'hungldm'));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: this,
    );
  }
}
