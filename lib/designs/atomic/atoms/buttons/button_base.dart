import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

/// {@template button_base}
/// A fundamental [ButtonBase] atom in the Book Stack Design System.
/// 
/// ### Atomic Level
/// **Atom** – Smallest reusable UI component.
/// 
/// ### Overview
/// Provides a highly customizable button for atomic-level interactions, supporting gradients, shadows, and responsive sizing.
/// 
/// ### Parameters
/// - `child`: The widget displayed inside the button (typically text or icon).
/// - `onPressed`: Callback executed when the button is tapped.
/// - `width`: The width of the button.
/// - `height`: The height of the button.
/// - `backgroundColor`: The background color of the button.
/// - `hoverColor`: The color when the button is hovered.
/// - `splashColor`: The splash color on tap.
/// - `focusColor`: The color when the button is focused.
/// - `highlightColor`: The color when the button is highlighted.
/// - `gradientBorder`: Optional gradient border for visual emphasis.
/// - `borderRadius`: The border radius for rounded corners.
/// - `boxShadow`: List of shadows for elevation effects.
/// - `padding`: Padding inside the button.
/// 
/// ### Returns
/// A tappable, customizable [Widget] suitable for atomic design usage.
/// 
/// ### Example
/// ```dart
/// ButtonBase(
///   child: Text('Click Me'),
///   onPressed: () {},
///   backgroundColor: Colors.blue,
///   borderRadius: 8,
/// )
/// ```
/// {@endtemplate}

/// {@macro button_base}
class ButtonBase extends StatelessWidget {
  const ButtonBase({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.focusColor,
    this.highlightColor,
    this.gradientBorder,
    this.borderRadius,
    this.boxShadow,
    this.padding,
  });

  /// The widget displayed inside the button (typically text or icon).
  final Widget child;

  /// Callback executed when the button is tapped.
  final VoidCallback? onPressed;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The color when the button is hovered.
  final Color? hoverColor;

  /// The splash color on tap.
  final Color? splashColor;

  /// The color when the button is focused.
  final Color? focusColor;

  /// The color when the button is highlighted.
  final Color? highlightColor;

  /// Optional gradient border for visual emphasis.
  final GradientBoxBorder? gradientBorder;

  /// The border radius for rounded corners.
  final double? borderRadius;

  /// List of shadows for elevation effects.
  final List<BoxShadow>? boxShadow;

  /// Padding inside the button.
  final EdgeInsetsGeometry? padding;
  
  @override
  Widget build(BuildContext context) {
    final BorderRadius? border = borderRadius != null
        ? BorderRadius.circular(BookStackScreenSize.radius(context, borderRadius!))
        : null;

    return InkWell(
      splashColor: splashColor,
      highlightColor: highlightColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      borderRadius: border,
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsetsGeometry.zero,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height ?? BookStackScreenSize.height(context, 29),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: border,
              boxShadow: boxShadow,
              border: gradientBorder,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
