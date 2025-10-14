import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SkeletonCard Atom', () {
    testWidgets('renders with default parameters', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonCard(),
          ),
        ),
      );
      expect(find.byType(SkeletonCard), findsOneWidget);
    });

    testWidgets('applies custom width and height', (WidgetTester tester) async {
      const double width = 120;
      const double height = 80;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonCard(width: width, height: height),
          ),
        ),
      );
      final Iterable<Container> containers = tester.widgetList<Container>(find.byType(Container));
      final Container container = containers.firstWhere(
        (Container c) => c.constraints?.maxWidth == width && c.constraints?.maxHeight == height,
        orElse: () => throw StateError('No Container with expected constraints found'),
      );
      expect(container.constraints?.maxWidth, width);
      expect(container.constraints?.maxHeight, height);
    });

    testWidgets('applies custom borderRadius', (WidgetTester tester) async {
      const BorderRadius borderRadius = BorderRadius.all(Radius.circular(20));
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonCard(borderRadius: borderRadius),
          ),
        ),
      );
      final Iterable<ClipRRect> clipRRects = tester.widgetList<ClipRRect>(find.byType(ClipRRect));
      final ClipRRect clipRRect = clipRRects.firstWhere(
        (ClipRRect c) => c.borderRadius == borderRadius,
        orElse: () => throw StateError('No ClipRRect with expected borderRadius found'),
      );
      expect(clipRRect.borderRadius, borderRadius);
    });

    testWidgets('applies custom margin', (WidgetTester tester) async {
      const EdgeInsets margin = EdgeInsets.all(10);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkeletonCard(margin: margin),
          ),
        ),
      );
      final Iterable<Container> containers = tester.widgetList<Container>(find.byType(Container));
      final Container container = containers.firstWhere(
        (Container c) => c.margin == margin,
        orElse: () => throw StateError('No Container with expected margin found'),
      );
      expect(container.margin, margin);
    });
  });
}
