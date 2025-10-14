import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookStackTheme Atom', () {
    testWidgets('renders correctly with default theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: BookStackTheme().lightTheme(),
          home: const Scaffold(
            body: Text('Book Stack Theme'),
          ),
        ),
      );
      expect(find.text('Book Stack Theme'), findsOneWidget);
    });

    testWidgets('renders correctly with dark theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: BookStackTheme().darkTheme(),
          home: const Scaffold(
            body: Text('Book Stack Theme'),
          ),
        ),
      );
      expect(find.text('Book Stack Theme'), findsOneWidget);
    });
  });
}
