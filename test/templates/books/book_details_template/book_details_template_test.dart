import 'package:book_stack_design_system/designs/atomic/templates/books/book_details_template/book_details_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookDetailsTemplate Template', () {
    testWidgets('renders correctly with sample parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BookDetailsTemplate(
                title: 'Sample Book',
                author: 'Author Name',
                image: '',
                price: '10.99',
                publisher: 'Publisher Name',
                language: 'English',
                pages: '123',
                year: '2025',
                description: 'Sample Description',
                pdfs: const <String, String>{},
                isFavorite: false,
                initialRating: 3,
                onBack: () {},
                onToggleFavorite: () {},
                onRatingChange: (int rating) {},
                onTapPDFs: (String index) {},
              ),
            ),
          ),
        ),
      );
      expect(find.byType(BookDetailsTemplate), findsOneWidget);
      expect(find.text('Sample Book'), findsOneWidget);
      expect(find.text('Author Name'), findsOneWidget);
      expect(find.text('Sample Description'), findsOneWidget);
    });

    testWidgets('renders custom description', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BookDetailsTemplate(
                title: 'Book Title',
                author: 'Book Author',
                image: '',
                price: '15.99',
                publisher: 'Book Publisher',
                language: 'Spanish',
                pages: '456',
                year: '2024',
                description: 'Book Details Body',
                pdfs: const <String, String>{},
                isFavorite: true,
                initialRating: 5,
                onBack: () {},
                onToggleFavorite: () {},
                onRatingChange: (int rating) {},
                onTapPDFs: (String index) {},
              ),
            ),
          ),
        ),
      );
      expect(find.text('Book Details Body'), findsOneWidget);
    });
  });
}
