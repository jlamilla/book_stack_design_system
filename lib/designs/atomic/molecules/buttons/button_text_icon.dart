import 'package:book_stack_design_system/designs/atomic/atoms/buttons/button_base.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

enum ButtonIconPosition { left, right }
enum ButtonTextIconType { primary, secondary, custom }

/// {@template button_text_icon}
/// A [ButtonTextIcon] molecule for the Book Stack Design System.
/// Provides a customizable button with text and optional icon, supporting gradient borders, backgrounds, and multiple style variants.
///
/// ### Atomic Level
/// **Molecule** – Composed UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `icon`: Optional icon to display alongside the text.
/// - `iconPosition`: Position of the icon (left or right of the text).
/// - `textWidget`: Widget to display as button content. If provided, overrides [text].
/// - `text`: The label displayed inside the button.
/// - `type`: The button style variant, defined by [ButtonTextIconType].
/// - `width`: The width of the button.
/// - `height`: The height of the button.
/// - `onPressed`: Callback executed when the button is tapped.
/// - `paddingButton`: Internal padding for the button.
/// - `paddingContent`: Internal padding for the button content.
/// - `textAlign`: Alignment for the button text.
/// - `textStyle`: Custom text style for the label.
/// - `borderWidth`: Width of the button border.
/// - `borderRadius`: Border radius for rounded corners.
/// - `boxShadow`: List of shadows applied to the button.
/// - `gradientBorder`: Custom gradient border for the button.
/// - `backgroundGradientColor`: Custom gradient for the background.
/// - `backgroundColor`: Solid background color (used if no gradient).
/// - `hoverColor`: Hover color for interactive states.
/// - `splashColor`: Splash color for interactive states.
/// - `focusColor`: Focus color for interactive states.
/// - `highlightColor`: Highlight color for interactive states.
///
/// ### Returns
/// Renders a button with text and optional icon, supporting gradient borders, backgrounds, and style variants for atomic design systems.
///
/// ### Example
/// ```dart
/// ButtonTextIcon(
///   text: 'Subscribe',
///   type: ButtonTextIconType.primary,
///   onPressed: () {},
///   icon: Icon(Icons.star),
///   iconPosition: ButtonIconPosition.left,
/// )
/// ```
/// {@endtemplate}
class ButtonTextIcon extends StatelessWidget {
  /// {@macro button_text_icon}
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
    this.icon,
    this.iconPosition = ButtonIconPosition.left,
  });

  /// Optional icon to display alongside the text.
  final Widget? icon;
  /// Position of the icon: left or right of the text.
  final ButtonIconPosition iconPosition;

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

  /// Internal padding for the button.
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
        style = textStyle ?? GoogleFonts.inter( 
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: BookStackScreenSize.fontSize(context, 16),
            fontWeight: FontWeight.w700,
          ),
        );
      case ButtonTextIconType.secondary:
        backgroundC = Theme.of(context).colorScheme.secondary;
        style = textStyle ?? GoogleFonts.inter(
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
        child: textWidget ?? Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: icon != null
              ? (iconPosition == ButtonIconPosition.left
                  ? <Widget>[icon!, const SizedBox(width: 8), Text(
                      text,
                      textAlign: textAlign ?? TextAlign.center,
                      maxLines: null,
                      softWrap: true,
                      style: style,
                    )]
                  : <Widget>[Text(
                      text,
                      textAlign: textAlign ?? TextAlign.center,
                      maxLines: null,
                      softWrap: true,
                      style: style,
                    ), const SizedBox(width: 8), icon!])
              : <Widget>[Text(
                  text,
                  textAlign: textAlign ?? TextAlign.center,
                  maxLines: null,
                  softWrap: true,
                  style: style,
                )],
        ),
      ),
    );
  }
}
