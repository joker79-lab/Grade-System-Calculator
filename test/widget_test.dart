import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grade_system_calculator/main.dart';

void main() {
  testWidgets('Splash screen shows the app branding', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Student Grade Calculator'), findsAtLeastNWidgets(1));
    expect(find.text('Calculate Your Grades Easily'), findsOneWidget);
  });

  testWidgets('Calculator screen displays required fields after splash', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('Student Name'), findsOneWidget);
    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Science'), findsOneWidget);
    expect(find.text('Filipino'), findsOneWidget);
    expect(find.text('Computer'), findsOneWidget);
    expect(find.text('Calculate Average'), findsOneWidget);
  });
}
