import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: 'login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'login':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const LoginScreen().wrap(context),
            );
          case 'logout':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const LogoutScreen(),
            );
          default:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const MainScreen(),
            );
        }
      },
    );
  }
}
