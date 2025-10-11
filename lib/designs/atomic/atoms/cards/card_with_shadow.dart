import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

class CardWithShadow extends StatelessWidget {
  /// {@template card_with_shadow}
  /// CardWithShadow
  ///
  /// An atomic design widget that provides a customizable card container with optional padding, margin, shadow, border, and gradient.
  ///
  /// This widget is designed for use in atomic design systems, serving as a foundational "atom" for building more complex UI molecules and organisms.
  ///
  /// It supports design tokens for colors, gradients, and spacing, ensuring consistency and maintainability across your design system.
  ///
  /// Example usage:
  /// ```dart
  /// CardWithShadow(
  ///   child: Text('Content'),
  ///   backgroundColor: BookStackColors.cardBackgroundBlack50,
  ///   shadowColor: BookStackColors.cardShadowPurple19,
  ///   gradientColorsBorder: [
  ///     BookStackColors.cardBorderGradientEnd,
  ///     BookStackColors.cardBorderGradientWhite05,
  ///     BookStackColors.cardBorderGradientWhite15,
  ///     BookStackColors.cardBorderGradientPurple57,
  ///     BookStackColors.cardBorderGradientPurple72,
  ///     BookStackColors.cardBorderGradientMid,
  ///   ],
  /// )
  /// ```
  /// {@endtemplate}
  const CardWithShadow({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 24,
    this.borderWidth = 2,
    this.padding,
    this.paddingChildren,
    this.margin,
    this.boxShadow,
    this.backgroundColor,
    this.gradientChildren,
    this.gradientColorsBorder,
  });

  /// The widget below the card, typically the main content.
  final Widget child;

  /// The width of the card. If null, the card will size to its child.
  final double? width;

  /// The height of the card. If null, the card will size to its child.
  final double? height;

  /// The border radius of the card. Defaults to 24.
  final double borderRadius;

  /// The width of the border. Defaults to 2.
  final double borderWidth;

  /// The margin around the card. If null, uses the default design token spacing.
  final EdgeInsetsGeometry? margin;

  /// The padding inside the card. If null, uses the default design token spacing.
  final EdgeInsetsGeometry? padding;

  /// The padding for the child widget inside the card. If null, uses the default design token spacing.
  final EdgeInsetsGeometry? paddingChildren;

  /// The list of shadows applied to the card. If null, uses the default design token shadows.
  final List<BoxShadow>? boxShadow;

  /// The background color of the card. If null, uses the default design token color.
  final Color? backgroundColor;

  /// The gradient applied to the card's child container. If null, uses a default vertical gradient.
  final Gradient? gradientChildren;

  /// The list of colors used for the card's border gradient. If null, uses the default design token gradient.
  final List<Color>? gradientColorsBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? BookStackScreenSize.fromLTRB(
        context,
        top: 8,
        bottom: 8,
        left: 26,
        right: 18,
      ),
      child: Container(
        margin: margin ?? BookStackScreenSize.fromLTRB(
          context,
          left: 7,
          top: 4,
          right: 7,
          bottom: 4,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
