import 'package:flutter/material.dart';

import 'animation_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: HomePage.newInstance(),
      home: AnimationDemo(),
    );
  }
}
