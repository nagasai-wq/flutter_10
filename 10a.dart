// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_10/main.dart'; // Adjust import if project name differs

void main() {
  testWidgets('Initial counter value is 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Counter: 0'), findsOneWidget);
  });

  testWidgets('Tapping increment button increases counter by 1', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Counter: 1'), findsOneWidget);
  });

  testWidgets('Tapping decrement button decreases counter by 1', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Increment twice first
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Counter: 2'), findsOneWidget);

    // Decrement once
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('Counter: 1'), findsOneWidget);
  });

  testWidgets('Counter value never goes below 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Counter: 0'), findsOneWidget);

    // Try to decrement below 0
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('Counter: 0'), findsOneWidget);
  });

  testWidgets('Counter text displays correctly on screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Text), findsWidgets);
    expect(find.text('Counter Application'), findsOneWidget);
  });
}
