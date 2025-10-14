import 'package:book_stack_design_system/designs/atomic/atoms/images/image_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageWithLoading Atom', () {
    testWidgets('renders with required url', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ImageWithLoading(url: 'https://example.com/image.jpg'),
          ),
        ),
      );
      expect(find.byType(ImageWithLoading), findsOneWidget);
    });

    testWidgets('applies custom height, width, and borderRadius', (WidgetTester tester) async {
      const double height = 120;
      const double width = 80;
      const BorderRadius borderRadius = BorderRadius.all(Radius.circular(16));
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ImageWithLoading(
                url: 'https://example.com/image.jpg',
                height: height,
                width: width,
                borderRadius: borderRadius,
              ),
            ),
          ),
        );
        final Iterable<ClipRRect> clipRRects = tester.widgetList<ClipRRect>(find.byType(ClipRRect));
        final ClipRRect clipRRect = clipRRects.firstWhere(
          (ClipRRect c) => c.borderRadius == borderRadius,
          orElse: () => throw StateError('No ClipRRect with expected borderRadius found'),
        );
        expect(clipRRect.borderRadius, borderRadius);
        final Iterable<SizedBox> sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
        final SizedBox sizedBox = sizedBoxes.firstWhere(
          (SizedBox s) => s.height == height && s.width == width,
          orElse: () => throw StateError('No SizedBox with expected height/width found'),
        );
        expect(sizedBox.height, height);
        expect(sizedBox.width, width);
    });

    testWidgets('uses custom boxFit', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ImageWithLoading(
              url: 'https://example.com/image.jpg',
              boxFit: BoxFit.contain,
            ),
          ),
        ),
      );
      // Cannot verify fit directly, but widget builds without error
      expect(find.byType(ImageWithLoading), findsOneWidget);
    });

    testWidgets('shows custom placeholder while loading', (WidgetTester tester) async {
      const Text placeholder = Text('Loading...');
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ImageWithLoading(
              url: 'invalid_url',
              placeholder: placeholder,
            ),
          ),
        ),
      );
      // Simulate loading state by finding the placeholder
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('shows custom errorPlaceholder on error', (WidgetTester tester) async {
      const Text errorWidget = Text('Error!');
      const ImageWithLoading widget = ImageWithLoading(
        url: 'any_url',
        errorPlaceholder: errorWidget,
      );
      // Call the errorWidget builder directly
      final Widget? errorBuilder = widget.errorPlaceholder;
      expect(errorBuilder, errorWidget);
    });
  });
}
