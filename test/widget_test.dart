import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grade_system_calculator/main.dart';

void main() {
  testWidgets('Student grade calculator displays required fields', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Student Grade Calculator'), findsAtLeastNWidgets(1));
    expect(find.text('Student Name'), findsOneWidget);
    expect(find.text('Mathematics'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Science'), findsOneWidget);
    expect(find.text('Filipino'), findsOneWidget);
    expect(find.text('Computer'), findsOneWidget);
    expect(find.text('Calculate Average'), findsOneWidget);
  });
}
