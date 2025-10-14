import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template card_base}
/// A foundational [CardBase] atom in the Book Stack Design System.
/// 
/// ### Atomic Level
/// **Atom** – Smallest reusable UI component.
/// 
/// ### Overview
/// Provides a customizable card container for atomic-level layouts, supporting padding, elevation, color, and responsive border radius.
/// 
/// ### Parameters
/// - `child`: The widget displayed inside the card.
/// - `padding`: Padding inside the card. Defaults to horizontal 16 responsive units.
/// - `width`: The width of the card.
/// - `height`: The height of the card.
/// - `color`: The background color of the card. Defaults to theme card color.
/// - `boxShadow`: List of shadows for elevation effects.
/// - `borderRadius`: The border radius for rounded corners. Defaults to 16.
/// 
/// ### Returns
/// A [Container] widget styled as a card, suitable for atomic design usage.
/// 
/// ### Example
/// ```dart
/// CardBase(
///   child: Text('Book Title'),
///   color: Colors.white,
///   boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
/// )
/// ```
/// {@endtemplate}

/// {@macro card_base}
class CardBase extends StatelessWidget {
  const CardBase({
    super.key,
    this.child,
    this.padding,
    this.width,
    this.height,
    this.color,
    this.boxShadow,
    this.borderRadius = 16,
  });

  /// The widget displayed inside the card.
  final Widget? child;

  /// Padding inside the card. Defaults to horizontal 16 responsive units.
  final EdgeInsetsGeometry? padding;

  /// The width of the card.
  final double? width;

  /// The height of the card.
  final double? height;

  /// The background color of the card. Defaults to theme card color.
  final Color? color;

  /// List of shadows for elevation effects.
  final List<BoxShadow>? boxShadow;

  /// The border radius for rounded corners. Defaults to 16.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BookStackScreenSize.radius(context, borderRadius),
        ),
        boxShadow: boxShadow,
        color: color ?? Theme.of(context).cardColor,
      ),
      padding: padding ?? BookStackScreenSize.symmetric(context, horizontal: 16),
      child: child,
    );
  }
}
