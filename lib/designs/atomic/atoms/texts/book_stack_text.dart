import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template book_stack_text}
/// A [BookStackText] atom for the Book Stack Design System.
/// Displays responsive text with customizable style, font size, max lines, overflow, and alignment.
///
/// ### Atomic Level
/// **Atom** – Smallest UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `text`: The string to display.
/// - `style`: Optional [TextStyle] for custom text appearance.
/// - `fontSize`: Optional font size, made responsive to screen size.
/// - `maxLines`: Maximum number of lines for the text. Defaults to 1.
/// - `overflow`: How visual overflow should be handled.
/// - `textAlign`: How the text should be aligned horizontally.
///
/// ### Returns
/// Renders a [Text] widget with responsive font size and customizable style, suitable for atomic design typography.
///
/// ### Example
/// ```dart
/// BookStackText(
///   text: 'Book Stack Atom',
///   fontSize: 18,
///   style: TextStyle(fontWeight: FontWeight.bold),
///   maxLines: 2,
///   overflow: TextOverflow.ellipsis,
///   textAlign: TextAlign.center,
/// )
/// ```
/// {@endtemplate}
class BookStackText extends StatelessWidget {

  /// {@macro book_stack_text}
  const BookStackText({
    super.key,
    required this.text,
    this.style,
    this.fontSize,
    this.maxLines = 1,
    this.overflow,
    this.textAlign,
  });
  /// The string to display.
  final String text;
  /// Optional style for custom text appearance.
  final TextStyle? style;
  /// Optional font size, made responsive to screen size.
  final double? fontSize;
  /// Maximum number of lines for the text. Defaults to 1.
  final int? maxLines;
  /// How visual overflow should be handled.
  final TextOverflow? overflow;
  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    double? resolvedFontSize;
    if (fontSize != null) {
      resolvedFontSize = BookStackScreenSize.fontSize(context, fontSize!);
    } else if (style?.fontSize != null) {
      resolvedFontSize = BookStackScreenSize.fontSize(context, style!.fontSize!);
    }

    return Text(
      text,
      style: style?.copyWith(fontSize: resolvedFontSize) ?? TextStyle(fontSize: resolvedFontSize),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
