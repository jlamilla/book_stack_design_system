import 'package:book_stack_design_system/designs/atomic/molecules/informative_components/informative_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InformativeComponent Molecule', () {
    testWidgets('renders search type with default text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: <Widget>[
                InformativeComponent(type: InformativeComponentType.search),
              ],
            ),
          ),
        ),
      );
      expect(find.text('There are no matches for the search.'), findsOneWidget);
      expect(find.text('Try different keywords or check your spelling.'), findsOneWidget);
    });

    testWidgets('renders error type with default text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: <Widget>[
                InformativeComponent(type: InformativeComponentType.error),
              ],
            ),
          ),
        ),
      );
      expect(find.text('An error occurred while searching for books.'), findsOneWidget);
      expect(find.text('Please try again later.'), findsOneWidget);
    });

    testWidgets('renders addData type with default text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: <Widget>[
                InformativeComponent(type: InformativeComponentType.addData),
              ],
            ),
          ),
        ),
      );
      expect(find.text('Add your favorite books.'), findsOneWidget);
    });

    testWidgets('renders custom type with custom title, subtitle, and image', (WidgetTester tester) async {
      const String customTitle = 'Custom Title';
      const String customSubtitle = 'Custom Subtitle';
      const Icon customImage = Icon(Icons.info);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: <Widget>[
                InformativeComponent(
                  type: InformativeComponentType.custom,
                  title: customTitle,
                  subTitle: customSubtitle,
                  image: customImage,
                ),
              ],
            ),
          ),
        ),
      );
      expect(find.text(customTitle), findsOneWidget);
      expect(find.text(customSubtitle), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });
  });
}
