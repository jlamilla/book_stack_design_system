import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/informative_components/informative_component.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/buttons/button_text_icon.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/books_list_info_template/books_list_info_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksListInfoTemplate Template', () {
    testWidgets('renders correctly with sample parameters', (tester) async {
      final List<Map<String, String>> books = <Map<String, String>>[
        <String, String>{
          'id': '1',
          'title': 'Sample Book',
          'subtitle': 'Subtitle',
          'imageUrl': '',
          'price': '10.99',
        },
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: books,
                getIdBook: (Map<String, String> book) => book['id']!,
                getTitleBook: (Map<String, String> book) => book['title']!,
                getSubTitleBook: (Map<String, String> book) => book['subtitle']!,
                getImageUrlBook: (Map<String, String> book) => book['imageUrl']!,
                getPriceBook: (Map<String, String> book) => book['price']!,
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
              ),
            ),
          ),
        ),
      );
      expect(
        find.byWidgetPredicate((widget) => widget.runtimeType.toString().startsWith('BooksListInfoTemplate')),
        findsOneWidget,
      );
      expect(find.text('Sample Book'), findsOneWidget);
    });

    testWidgets('shows loading skeletons when isLoading is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: const <Map<String, String>>[],
                getIdBook: (Map<String, String> book) => '',
                getTitleBook: (Map<String, String> book) => '',
                getSubTitleBook: (Map<String, String> book) => '',
                getImageUrlBook: (Map<String, String> book) => '',
                getPriceBook: (Map<String, String> book) => '',
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
                isLoading: true,
              ),
            ),
          ),
        ),
      );
      expect(find.byType(SkeletonCard), findsWidgets);
    });

    testWidgets('shows error state when error is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: const <Map<String, String>>[],
                getIdBook: (Map<String, String> book) => '',
                getTitleBook: (Map<String, String> book) => '',
                getSubTitleBook: (Map<String, String> book) => '',
                getImageUrlBook: (Map<String, String> book) => '',
                getPriceBook: (Map<String, String> book) => '',
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
                error: true,
              ),
            ),
          ),
        ),
      );
      expect(find.byType(InformativeComponent), findsWidgets);
    });

    testWidgets('shows empty state in favorite mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: const <Map<String, String>>[],
                getIdBook: (Map<String, String> book) => '',
                getTitleBook: (Map<String, String> book) => '',
                getSubTitleBook: (Map<String, String> book) => '',
                getImageUrlBook: (Map<String, String> book) => '',
                getPriceBook: (Map<String, String> book) => '',
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
                isFavorite: true,
              ),
            ),
          ),
        ),
      );
      expect(find.byType(InformativeComponent), findsWidgets);
    });

    testWidgets('shows sort dropdown when visibilitySorts is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: const <Map<String, String>>[],
                getIdBook: (Map<String, String> book) => '',
                getTitleBook: (Map<String, String> book) => '',
                getSubTitleBook: (Map<String, String> book) => '',
                getImageUrlBook: (Map<String, String> book) => '',
                getPriceBook: (Map<String, String> book) => '',
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
                visibilitySorts: true,
                sortOptions: const ['Price', 'Title'],
              ),
            ),
          ),
        ),
      );
      expect(find.byType(DropdownMenu<String>), findsOneWidget);
      // Solo verifica que el texto exista, no que sea único
      expect(find.text('Price'), findsAtLeastNWidgets(1));
      expect(find.text('Title'), findsAtLeastNWidgets(1));
    });

    testWidgets('shows favorites button when visibilityFavorite is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: const <Map<String, String>>[],
                getIdBook: (Map<String, String> book) => '',
                getTitleBook: (Map<String, String> book) => '',
                getSubTitleBook: (Map<String, String> book) => '',
                getImageUrlBook: (Map<String, String> book) => '',
                getPriceBook: (Map<String, String> book) => '',
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async => <Map<String, String>>[],
                hasMore: false,
                visibilityFavorite: true,
              ),
            ),
          ),
        ),
      );
      expect(find.byType(ButtonTextIcon), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
    });

    testWidgets('loads more books on scroll', (tester) async {
      bool loadMoreCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(400, 800)),
            child: Scaffold(
              body: BooksListInfoTemplate<Map<String, String>>(
                booksList: List.generate(50, (i) => {'id': '$i', 'title': 'Book $i', 'subtitle': '', 'imageUrl': '', 'price': ''}),
                getIdBook: (Map<String, String> book) => book['id']!,
                getTitleBook: (Map<String, String> book) => book['title']!,
                getSubTitleBook: (Map<String, String> book) => book['subtitle']!,
                getImageUrlBook: (Map<String, String> book) => book['imageUrl']!,
                getPriceBook: (Map<String, String> book) => book['price']!,
                onTapDetailsBook: (Map<String, String> book) {},
                onLoadMore: () async {
                  loadMoreCalled = true;
                  return <Map<String, String>>[];
                },
                hasMore: true,
                isFavorite: false,
                isLoading: false,
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      final scrollable = find.byType(Scrollable);
      final ScrollableState scrollState = tester.state<ScrollableState>(scrollable);
      scrollState.position.jumpTo(scrollState.position.maxScrollExtent);
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(loadMoreCalled, isTrue);
    });
  });
}
