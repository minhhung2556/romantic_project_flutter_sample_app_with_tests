// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttersampleappwithtests/keys.dart';
import 'package:fluttersampleappwithtests/main.dart';

void main() {
  testWidgets('HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(ValueKey(AssetKeys.increaseButton)));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byKey(ValueKey(AssetKeys.decreaseButton)));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsOneWidget);
  });
}
