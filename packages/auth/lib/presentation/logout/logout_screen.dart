import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout Screen'),
      ),
      body: const Center(
        child: Text('This is the Logout Screen'),
      ),
    );
  }
}
