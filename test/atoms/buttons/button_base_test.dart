import 'package:book_stack_design_system/designs/atomic/atoms/buttons/button_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_borders/gradient_borders.dart';

void main() {
  testWidgets('ButtonBase renders with child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            child: Text('Click Me'),
          ),
        ),
      ),
    );
    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('ButtonBase calls onPressed when tapped', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            child: const Text('Tap'),
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );
    await tester.tap(find.byType(ButtonBase));
    expect(tapped, isTrue);
  });

  testWidgets('ButtonBase applies backgroundColor', (WidgetTester tester) async {
    const MaterialColor color = Colors.red;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            backgroundColor: color,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final Container container = tester.widget<Container>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Container),
    ));
    final BoxDecoration decoration = container.decoration! as BoxDecoration;
    expect(decoration.color, color);
  });

  testWidgets('ButtonBase applies borderRadius', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            borderRadius: 16,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final Container container = tester.widget<Container>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Container),
    ));
    final BoxDecoration decoration = container.decoration! as BoxDecoration;
    expect(decoration.borderRadius, isNotNull);
  });

  testWidgets('ButtonBase applies gradient border', (WidgetTester tester) async {
    const GradientBoxBorder gradientBorder = GradientBoxBorder(
      gradient: LinearGradient(colors: <Color>[Colors.blue, Colors.green]),
      width: 2,
    );
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            gradientBorder: gradientBorder,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final Container container = tester.widget<Container>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Container),
    ));
    final BoxDecoration decoration = container.decoration! as BoxDecoration;
    expect(decoration.border, gradientBorder);
  });

  testWidgets('ButtonBase applies boxShadow', (WidgetTester tester) async {
    final List<BoxShadow> shadow = <BoxShadow>[const BoxShadow(color: Colors.black, blurRadius: 4)];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            boxShadow: shadow,
            child: const SizedBox(),
          ),
        ),
      ),
    );
    final Container container = tester.widget<Container>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Container),
    ));
    final BoxDecoration decoration = container.decoration! as BoxDecoration;
    expect(decoration.boxShadow, shadow);
  });

  testWidgets('ButtonBase applies padding', (WidgetTester tester) async {
    const EdgeInsets padding = EdgeInsets.all(20);
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            padding: padding,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final Iterable<Padding> paddings = tester.widgetList<Padding>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Padding),
    ));
    final Padding correctPadding = paddings.firstWhere(
      (p) => p.padding == padding,
      orElse: () => throw StateError('No Padding with expected value found'),
    );
    expect(correctPadding.padding, padding);
  });

  testWidgets('ButtonBase applies splash, hover, focus, highlight colors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            splashColor: Colors.yellow,
            hoverColor: Colors.green,
            focusColor: Colors.purple,
            highlightColor: Colors.orange,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final InkWell inkWell = tester.widget<InkWell>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(InkWell),
    ));
    expect(inkWell.splashColor, Colors.yellow);
    expect(inkWell.hoverColor, Colors.green);
    expect(inkWell.focusColor, Colors.purple);
    expect(inkWell.highlightColor, Colors.orange);
  });

  testWidgets('ButtonBase uses responsive sizing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonBase(
            height: 40,
            width: 100,
            child: SizedBox(),
          ),
        ),
      ),
    );
    final Container container = tester.widget<Container>(find.descendant(
      of: find.byType(ButtonBase),
      matching: find.byType(Container),
    ));
    final BoxConstraints? constraints = container.constraints;
    expect(constraints?.minHeight, 40);
    expect(constraints?.maxWidth, 100);
  });
}
