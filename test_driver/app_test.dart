import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'home_page_test.dart';

void main() {
  group('Counter App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      if (driver == null) driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    homePageTest(driver);
  });
}
