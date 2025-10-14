import 'package:book_stack_design_system/designs/atomic/molecules/rating/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RatingStar Molecule', () {
    testWidgets('renders with required parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingStar(
              globalRating: 4,
              onRatingChange: (_) {},
            ),
          ),
        ),
      );
      expect(find.text('Rate this book'), findsOneWidget);
      expect(find.text('General rating: 4/5'), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(5));
    });

    testWidgets('displays local rating', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingStar(
              globalRating: 5,
              localRating: 3,
              onRatingChange: (_) {},
            ),
          ),
        ),
      );
      expect(find.text('Your Rating'), findsOneWidget);
      expect(find.text('General rating: 5/5'), findsOneWidget);
    });

    testWidgets('calls onRatingChange when star is tapped', (WidgetTester tester) async {
      int? tappedRating;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingStar(
              globalRating: 2,
              onRatingChange: (int rating) => tappedRating = rating,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton).at(2)); // Tap third star
      expect(tappedRating, 3);
    });
  });
}
