import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('scrolling performance test', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connects to the app
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection
        driver.close();
      }
    });

    test('test increment', () async {
      // Find the increment button and counter
      SerializableFinder counterText = find.byValueKey('counterText');
      SerializableFinder incrementButton = find.byValueKey('incrementButton');

      // Press button 5 times
      for (int i = 0; i < 5; i++) {
        await driver.tap(incrementButton);
        // Emulate a user's finger taking its time to go back to the original
        // position before the next scroll
        await Future<void>.delayed(Duration(milliseconds: 500));
      }

      // Assert that the counter shows desired number
      expect(await driver.getText(counterText), "5");
    });

    test('failing test', () async {
      SerializableFinder counterText = find.byValueKey('counterText');
      expect(await driver.getText(counterText), "-1");
    });
  });
}