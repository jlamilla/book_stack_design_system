import 'package:book_stack_design_system/designs/atomic/atoms/cards/card_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardBase Atom', () {
    testWidgets('renders with child', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(child: Text('Book Title')),
          ),
        ),
      );
      expect(find.text('Book Title'), findsOneWidget);
    });

    testWidgets('applies custom color', (WidgetTester tester) async {
      const MaterialColor color = Colors.red;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(color: color, child: SizedBox()),
          ),
        ),
      );
      final Container container = tester.widget<Container>(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, color);
    });

    testWidgets('applies custom boxShadow', (WidgetTester tester) async {
      final List<BoxShadow> shadow = <BoxShadow>[const BoxShadow(color: Colors.black, blurRadius: 8)];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardBase(boxShadow: shadow, child: const SizedBox()),
          ),
        ),
      );
      final Container container = tester.widget<Container>(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow, shadow);
    });

    testWidgets('applies custom borderRadius', (WidgetTester tester) async {
      const double radius = 24.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(borderRadius: radius, child: SizedBox()),
          ),
        ),
      );
      final Container container = tester.widget<Container>(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, isNotNull);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      const EdgeInsets padding = EdgeInsets.all(20);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(padding: padding, child: SizedBox()),
          ),
        ),
      );
      final Iterable<Padding> paddings = tester.widgetList<Padding>(find.byType(Padding));
      final Padding correctPadding = paddings.firstWhere(
        (Padding p) => p.padding == padding,
        orElse: () => throw StateError('No Padding with expected value found'),
      );
      expect(correctPadding.padding, padding);
    });

    testWidgets('applies custom width and height', (WidgetTester tester) async {
      const double width = 120.0;
      const double height = 80.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(width: width, height: height, child: SizedBox()),
          ),
        ),
      );
      final Container container = tester.widget<Container>(find.byType(Container));
      final BoxConstraints? constraints = container.constraints;
      expect(constraints?.maxWidth, width);
      expect(constraints?.maxHeight, height);
    });

    testWidgets('uses default values when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBase(child: SizedBox()),
          ),
        ),
      );
      final Container container = tester.widget<Container>(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, isNotNull);
      expect(decoration.borderRadius, isNotNull);
      final Iterable<Padding> paddings = tester.widgetList<Padding>(find.byType(Padding));
      expect(paddings.isNotEmpty, true);
    });
  });
}
