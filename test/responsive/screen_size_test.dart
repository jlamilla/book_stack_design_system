import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
	group('BookStackScreenSize Organism', () {
		testWidgets('returns correct screen width and height', (WidgetTester tester) async {
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(body: SizedBox.expand()),
			));
			final BuildContext context = tester.element(find.byType(SizedBox));
			expect(BookStackScreenSize.screenWidth(context), greaterThan(0));
			expect(BookStackScreenSize.screenHeight(context), greaterThan(0));
		});

		testWidgets('width, height, fontSize, and radius scale responsively', (WidgetTester tester) async {
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(body: SizedBox.expand()),
			));
			final BuildContext context = tester.element(find.byType(SizedBox));
			final double w = BookStackScreenSize.width(context, 100);
			final double h = BookStackScreenSize.height(context, 100);
			final double f = BookStackScreenSize.fontSize(context, 16);
			final double r = BookStackScreenSize.radius(context, 8);
			expect(w, greaterThan(0));
			expect(h, greaterThan(0));
			expect(f, greaterThanOrEqualTo(10));
			expect(r, greaterThan(0));
		});

		testWidgets('EdgeInsets fromLTRB, all, and symmetric return valid EdgeInsets', (WidgetTester tester) async {
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(body: SizedBox.expand()),
			));
			final BuildContext context = tester.element(find.byType(SizedBox));
			final EdgeInsetsGeometry e1 = BookStackScreenSize.fromLTRB(context, left: 10, top: 10, right: 10, bottom: 10);
			final EdgeInsetsGeometry e2 = BookStackScreenSize.all(context, 12);
			final EdgeInsetsGeometry e3 = BookStackScreenSize.symmetric(context, horizontal: 8, vertical: 16);
			expect(e1, isA<EdgeInsetsGeometry>());
			expect(e2, isA<EdgeInsetsGeometry>());
			expect(e3, isA<EdgeInsetsGeometry>());
		});

		testWidgets('device type checks return booleans', (WidgetTester tester) async {
			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(body: SizedBox.expand()),
			));
			final BuildContext context = tester.element(find.byType(SizedBox));
			expect(BookStackScreenSize.isPhone(context), isA<bool>());
			expect(BookStackScreenSize.isTablet(context), isA<bool>());
			expect(BookStackScreenSize.isDesktop(context), isA<bool>());
			expect(BookStackScreenSize.isDesktopLarge(context), isA<bool>());
		});
	});
}
