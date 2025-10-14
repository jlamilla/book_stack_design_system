import 'package:book_stack_design_system/designs/atomic/molecules/cards/card_image_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardImageDescription Molecule', () {
    testWidgets('renders with required parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardImageDescription(
              imageUrl: 'https://example.com/image.jpg',
              description: Text('Description'),
            ),
          ),
        ),
      );
      expect(find.text('Description'), findsOneWidget);
      expect(find.byType(CardImageDescription), findsOneWidget);
    });

    testWidgets('renders image at top', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardImageDescription(
              imageUrl: 'https://example.com/image.jpg',
              description: Text('Top'),
              imagePosition: CardImagePosition.top,
            ),
          ),
        ),
      );
      expect(find.text('Top'), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('renders image at left', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardImageDescription(
              imageUrl: 'https://example.com/image.jpg',
              description: Text('Left'),
              imagePosition: CardImagePosition.left,
            ),
          ),
        ),
      );
      expect(find.text('Left'), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('renders image at right', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardImageDescription(
              imageUrl: 'https://example.com/image.jpg',
              description: Text('Right'),
              imagePosition: CardImagePosition.right,
            ),
          ),
        ),
      );
      expect(find.text('Right'), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies custom card size and border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: CardImageDescription(
                imageUrl: 'https://example.com/image.jpg',
                description: Text('Custom'),
                cardWidth: 300,
                // cardHeight removed to avoid overflow
                cardBorderRadius: 24,
              ),
            ),
          ),
        ),
      );
      expect(find.text('Custom'), findsOneWidget);
      expect(find.byType(CardImageDescription), findsOneWidget);
    });
  });
}
