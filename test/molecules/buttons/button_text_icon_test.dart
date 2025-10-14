import 'package:book_stack_design_system/designs/atomic/molecules/buttons/button_text_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ButtonTextIcon Molecule', () {
    testWidgets('renders with required parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonTextIcon(
              text: 'Subscribe',
              type: ButtonTextIconType.primary,
              onPressed: () {},
            ),
          ),
        ),
      );
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('renders icon on left', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonTextIcon(
              text: 'Left',
              type: ButtonTextIconType.primary,
              icon: const Icon(Icons.star),
              iconPosition: ButtonIconPosition.left,
              onPressed: () {},
            ),
          ),
        ),
      );
      final Row row = tester.widget<Row>(find.byType(Row));
      expect(row.children.first is Icon, true);
      expect(find.text('Left'), findsOneWidget);
    });

    testWidgets('renders icon on right', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonTextIcon(
              text: 'Right',
              type: ButtonTextIconType.primary,
              icon: const Icon(Icons.star),
              iconPosition: ButtonIconPosition.right,
              onPressed: () {},
            ),
          ),
        ),
      );
      final Row row = tester.widget<Row>(find.byType(Row));
      expect(row.children.last is Icon, true);
      expect(find.text('Right'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonTextIcon(
              text: 'Tap',
              type: ButtonTextIconType.primary,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ButtonTextIcon));
      expect(tapped, isTrue);
    });

    testWidgets('applies custom text style and type', (WidgetTester tester) async {
      const TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonTextIcon(
              text: 'Custom',
              type: ButtonTextIconType.custom,
              textStyle: style,
              onPressed: () {},
            ),
          ),
        ),
      );
      expect(find.text('Custom'), findsOneWidget);
    });
  });
}
