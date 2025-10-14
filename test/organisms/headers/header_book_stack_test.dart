import 'package:book_stack_design_system/designs/atomic/organisms/headers/header_book_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeaderBookStack Organism', () {
    testWidgets('renders home header with theme and search buttons', (WidgetTester tester) async {
      bool themeTapped = false;
      bool searchTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: HeaderBookStack(
              type: HeaderType.home,
              onToggleTheme: () => themeTapped = true,
              onSearch: () => searchTapped = true,
            ),
          ),
        ),
      );
      // Check for RichText containing both 'Book' and 'Stack'
      final Finder richTextFinder = find.byWidgetPredicate((Widget widget) {
        if (widget is RichText) {
          final TextSpan textSpan = widget.text as TextSpan;
          final String? text = textSpan.children?.map((InlineSpan span) => (span as TextSpan).text).join('');
          return text != null && text.contains('Book') && text.contains('Stack');
        }
        return false;
      });
      expect(richTextFinder, findsOneWidget);
      await tester.tap(find.byTooltip('Cambiar tema'));
      expect(themeTapped, isTrue);
      await tester.tap(find.byTooltip('Buscar'));
      expect(searchTapped, isTrue);
    });

    testWidgets('renders module header with title and back button', (WidgetTester tester) async {
      bool backTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: HeaderBookStack(
              type: HeaderType.module,
              title: 'Module Title',
              onBack: () => backTapped = true,
            ),
          ),
        ),
      );
      expect(find.text('Module Title'), findsOneWidget);
      await tester.tap(find.byTooltip('Back'));
      expect(backTapped, isTrue);
    });

    testWidgets('renders search header with custom search widget and back button', (WidgetTester tester) async {
      bool backTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: HeaderBookStack(
              type: HeaderType.search,
              textSearch: const Text('Search Here'),
              onBack: () => backTapped = true,
            ),
          ),
        ),
      );
      expect(find.text('Search Here'), findsOneWidget);
      await tester.tap(find.byTooltip('Atras'));
      expect(backTapped, isTrue);
    });
  });
}
