import 'package:book_stack_design_system/designs/atomic/atoms/inputs/book_stack_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookStackSearch Atom', () {
    testWidgets('renders with required controller', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookStackSearch(
              controller: controller,
              onTapClear: () {},
            ),
          ),
        ),
      );
      expect(find.byType(BookStackSearch), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays hint text', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      const String hint = 'Search books by title';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookStackSearch(
              controller: controller,
              hintText: hint,
              onTapClear: () {},
            ),
          ),
        ),
      );
      expect(find.text(hint), findsOneWidget);
    });

    testWidgets('shows clear button when text is not empty', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController(text: 'query');
      bool cleared = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookStackSearch(
              controller: controller,
              onTapClear: () {
                cleared = true;
                controller.clear();
              },
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.clear), findsOneWidget);
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();
      expect(cleared, isTrue);
      expect(controller.text, '');
    });

    testWidgets('does not show clear button when text is empty', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BookStackSearch(
              controller: controller,
              onTapClear: () {},
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.clear), findsNothing);
    });
  });
}
