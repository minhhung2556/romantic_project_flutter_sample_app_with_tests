import 'dart:convert' as json;

import 'package:flutter_driver/driver_extension.dart';
import 'package:fluttersampleappwithtests/main.dart' as app;

void main() {
  enableFlutterDriverExtension(
    handler: (request) async {
      print('DriverExtension: request=$request');
      final o = request != null ? json.jsonDecode(request) : {};
      final cmd = o['cmd'] ?? '';
      final data = o['data'] ?? '';

      switch (cmd) {
        default:
          print('unknown cmd $cmd');
          break;
      }
      return null;
    },
  );
  app.main();
}
