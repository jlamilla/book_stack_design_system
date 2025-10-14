import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// {@template skeleton_card}
/// A [SkeletonCard] atom for the Book Stack Design System.
/// Displays a shimmering skeleton placeholder for loading states, using the [shimmer](https://pub.dev/packages/shimmer) package for animated gradient effects.
///
/// ### Atomic Level
/// **Atom** – Smallest UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `width`: The width of the skeleton card. If null, expands to parent constraints.
/// - `height`: The height of the skeleton card. If null, expands to parent constraints.
/// - `borderRadius`: The border radius of the skeleton card. Defaults to 25 if not provided.
/// - `margin`: The margin around the skeleton card. If null, no margin is applied.
///
/// ### Returns
/// Renders a shimmering skeleton card with customizable size, border radius, and margin, suitable for loading states in atomic design systems.
///
/// ### Example
/// ```dart
/// SkeletonCard(
///   width: 200,
///   height: 100,
///   borderRadius: BorderRadius.circular(16),
///   margin: EdgeInsets.all(8),
/// )
/// ```
/// {@endtemplate}
class SkeletonCard extends StatelessWidget {
  /// {@macro skeleton_card}
  const SkeletonCard({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
  });

  /// The width of the skeleton card. If null, expands to parent constraints.
  final double? width;

  /// The height of the skeleton card. If null, expands to parent constraints.
  final double? height;

  /// The border radius of the skeleton card. Defaults to 25 if not provided.
  final BorderRadius? borderRadius;

  /// The margin around the skeleton card. If null, no margin is applied.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    width: width,
    margin: margin,
    child: ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(BookStackScreenSize.radius(context, 16)),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.onSurface.withOpacity(
          Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.65,
        ), 
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        child: Container(
          height: height,
          width: width,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    ),
  );
}
