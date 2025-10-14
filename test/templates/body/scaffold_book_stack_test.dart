import 'package:book_stack_design_system/designs/atomic/templates/body/scaffold_book_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScaffoldBookStack Template', () {
    testWidgets('renders correctly with default body', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ScaffoldBookStack(
            header: SizedBox(),
            body: SizedBox(),
          ),
        ),
      );
      expect(find.byType(ScaffoldBookStack), findsOneWidget);
    });

    testWidgets('renders custom body widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ScaffoldBookStack(
            header: SizedBox(),
            body: Text('Book Stack Body'),
          ),
        ),
      );
      expect(find.text('Book Stack Body'), findsOneWidget);
    });
  });
}
