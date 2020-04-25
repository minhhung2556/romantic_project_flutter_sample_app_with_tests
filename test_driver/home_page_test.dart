import 'package:flutter_driver/flutter_driver.dart';
import 'package:fluttersampleappwithtests/keys.dart';
import 'package:test/test.dart';

void homePageTest(FlutterDriver driver) {
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

  final text = find.byValueKey(AssetKeys.counterText);

  test("initial", () async {
    final count = await driver.getText(text);
    expect("0", count);
  });

  test("increase", () async {
    final button = find.byValueKey(AssetKeys.increaseButton);

    await driver.tap(button);
    final count = await driver.getText(text);
    expect("1", count);
  });

  test("decrease", () async {
    final button = find.byValueKey(AssetKeys.decreaseButton);

    await driver.tap(button);
    final count = await driver.getText(text);
    expect("0", count);
  });
}
