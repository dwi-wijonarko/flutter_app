// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp has a title and a button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app has a title
    expect(find.text('Hello World'), findsOneWidget);

    // Verify that our app has a floating action button
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Verify that out app has a search icon
    expect(find.byIcon(Icons.search), findsOneWidget);

    // Verify that out app has a gear icon
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Verify that out app has pop up menu
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
  });

  testWidgets('MyApp has a drawer', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Open drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    // Verify that our app has a drawer
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
