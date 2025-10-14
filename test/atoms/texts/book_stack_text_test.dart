import 'package:book_stack_design_system/designs/atomic/atoms/texts/book_stack_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookStackText Atom', () {
    testWidgets('renders with required text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BookStackText(text: 'Book Stack Atom'),
          ),
        ),
      );
      expect(find.text('Book Stack Atom'), findsOneWidget);
    });

    testWidgets('applies custom style and fontSize', (WidgetTester tester) async {
      const TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BookStackText(text: 'Styled', style: style, fontSize: 22),
          ),
        ),
      );
      expect(find.text('Styled'), findsOneWidget);
    });

    testWidgets('applies maxLines and overflow', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BookStackText(
              text: 'Line1 Line2',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
      final Text textWidget = tester.widget<Text>(find.text('Line1 Line2'));
      expect(textWidget.maxLines, 1);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('applies textAlign', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BookStackText(
              text: 'Center',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      final Text textWidget = tester.widget<Text>(find.text('Center'));
      expect(textWidget.textAlign, TextAlign.center);
    });
  });
}
