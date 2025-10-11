import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

/// {@template button_base}
/// Native Flutter button with borders, part of the atomic design system.
/// Highly customizable, with sensible defaults matching design tokens.
///
/// Default styles:
/// - Border: 1.06px solid gradient (vertical, darkBlue to blue)
/// - Box shadow: 4.24px 4.24px 59.36px 0px shadowBlue
/// - Background color: text
///
/// Example usage:
/// ```dart
/// ButtonBase(
///   onPressed: () {},
///   child: Text('Button'),
/// )
/// ```
/// {@endtemplate}
class ButtonBase extends StatelessWidget {
  /// Creates a button with borders and custom styles.
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

  /// Callback when the button is pressed.
  final VoidCallback? onPressed;

  /// Button content.
  final Widget child;

  /// Width of the button.
  final double? width;

  /// Height of the button.
  final double? height;

  /// Background color.
  final Color? backgroundColor;

  /// Hover color.
  final Color? hoverColor;

  /// Splash color.
  final Color? splashColor;

  /// Focus color.
  final Color? focusColor;

  /// Highlight color.
  final Color? highlightColor;

  /// Gradient for the border.
  final GradientBoxBorder? gradientBorder;

  /// Border radius.
  final double? borderRadius;

  /// Box shadow(s).
  final List<BoxShadow>? boxShadow;

  /// Padding inside the button.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      highlightColor: highlightColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsetsGeometry.zero,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: height ?? BookStackScreenSize.height(context, 29)),
          child: Container(
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
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
