import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:life_record/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LifeRecordApp());

    // Verify that the app renders without errors.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
