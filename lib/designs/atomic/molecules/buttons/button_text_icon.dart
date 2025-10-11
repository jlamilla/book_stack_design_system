import 'package:book_stack_design_system/designs/atomic/atoms/buttons/button_base.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

enum ButtonTextIconType { primary, secondary, custom }

class ButtonTextIcon extends StatelessWidget {
/// Atomic Design System: Gradient Text Button
///
/// This widget is part of an atomic design system for Flutter, providing a highly customizable button with gradient borders and backgrounds.
///
/// - Follows atomic design principles for scalability and maintainability.
/// - All documentation is provided inside the class for global visibility, as recommended by Flutter standards.
/// - Supports multiple button types via the [ButtonTextIconType] enum: primary, secondary, custom.
/// - Uses design tokens for colors and gradients, ensuring consistency across the app.
///
/// Example usage:
/// ```dart
/// ButtonTextIcon(
///   text: 'Subscribe',
///   type: ButtonTextIconType.primary,
///   onPressed: () {},
/// )
/// ```
///
/// [ButtonTextIconType.primary]: Main action button with gradient border, background, and shadow.
/// [ButtonTextIconType.secondary]: Secondary action button with radial gradient background and gradient border.
/// [ButtonTextIconType.tertiary]: Tertiary button with solid background and no shadow.
/// [ButtonTextIconType.inactive]: Disabled/inactive button style.
/// [ButtonTextIconType.custom]: Fully custom style via parameters.
  const ButtonTextIcon({
    super.key,
    this.textWidget,
    this.text = 'Example',
    required this.type,
    this.width,
    this.height,
    required this.onPressed,
    this.paddingButton,
    this.paddingContent,
    this.textAlign,
    this.textStyle,
    this.borderWidth = 1,
    this.borderRadius = 16,
    this.boxShadow,
    this.gradientBorder,
    this.backgroundGradientColor, 
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.focusColor,
    this.highlightColor,
  });

  /// The widget to display as button content. If provided, overrides [text].
  final Widget? textWidget;

  /// The label displayed inside the button.
  final String text;

  /// The button style variant, defined by [ButtonTextIconType].
  final ButtonTextIconType type;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// Callback executed when the button is tapped.
  final VoidCallback? onPressed;

  /// Internal padding for the button
  final EdgeInsetsGeometry? paddingButton;
  
  /// Internal padding for the button content.
  final EdgeInsetsGeometry? paddingContent;

  /// Alignment for the button text.
  final TextAlign? textAlign;

  /// Custom text style for the label.
  final TextStyle? textStyle;

  /// Width of the button border.
  final double? borderWidth;

  /// Border radius for rounded corners.
  final double? borderRadius;

  /// List of shadows applied to the button.
  final List<BoxShadow>? boxShadow;

  /// Custom gradient border for the button.
  final GradientBoxBorder? gradientBorder;

  /// Custom gradient for the background.
  final Gradient? backgroundGradientColor;

  /// Solid background color (used if no gradient).
  final Color? backgroundColor;

  /// Hover color for interactive states.
  final Color? hoverColor;

  /// Splash color for interactive states.
  final Color? splashColor;

  /// Focus color for interactive states.
  final Color? focusColor;

  /// Highlight color for interactive states.
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    Color? backgroundC;
    TextStyle? style;

    switch (type) {
      case ButtonTextIconType.primary:
        backgroundC = Theme.of(context).colorScheme.primary;
        style = textStyle ?? GoogleFonts.roboto( 
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: BookStackScreenSize.fontSize(context, 16),
            fontWeight: FontWeight.w700,
          ),
        );
      case ButtonTextIconType.secondary:
        backgroundC = Theme.of(context).colorScheme.secondary;
        style = textStyle ?? GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: BookStackScreenSize.fontSize(context, 16),
            fontWeight: FontWeight.bold,
          ),
        );
      case ButtonTextIconType.custom:
        backgroundC = backgroundColor;
        style = textStyle;
    }

    return ButtonBase(
      width: width,
      height: height,
      padding: paddingButton,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      backgroundColor: backgroundC,
      gradientBorder: gradientBorder,
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusColor: focusColor,
      highlightColor: highlightColor,
      onPressed: onPressed,
      child: Padding(
        padding: paddingContent ?? BookStackScreenSize.symmetric(context, horizontal: 24, vertical: 16),
        child: textWidget ?? Text(
          text,
          textAlign: textAlign ?? TextAlign.center,
          maxLines: null,
          softWrap: true,
          style: style,
        ),
      ),
    );
  }
}
