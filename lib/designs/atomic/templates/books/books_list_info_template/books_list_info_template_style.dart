/// Model for all style-related parameters of BooksListInfoTemplate
library;
import 'package:book_stack_design_system/designs/atomic/molecules/cards/card_image_description.dart';
import 'package:flutter/material.dart';

/// {@template books_list_info_template_style}
/// A [BooksListInfoTemplateStyle] template for the Book Stack Design System.
/// Provides style configuration for the books list info template, including card, image, grid, and spacing parameters.
///
/// ### Atomic Level
/// **Template** – Page-level layout in the Atomic Design System.
///
/// ### Parameters
/// - `cardHeight`: Height of each card.
/// - `cardWidth`: Width of each card.
/// - `cardBorderRadius`: Border radius of each card. Defaults to 16.
/// - `imageBorderRadius`: Border radius for the image.
/// - `imageErrorPlaceholder`: Widget to show if the image fails to load.
/// - `imageHeight`: Height of the image.
/// - `imagePlaceholder`: Widget to show while the image is loading.
/// - `imagePosition`: Position of the image in the card.
/// - `imageWidth`: Width of the image.
/// - `paddingContent`: Padding for the content inside the card.
/// - `paddingImage`: Padding for the image.
/// - `paddingDescription`: Padding for the description.
/// - `mainAxisSpacing`: Main axis spacing in the grid.
/// - `crossAxisSpacing`: Cross axis spacing in the grid.
/// - `childAspectRatio`: Aspect ratio of grid children. Defaults to 0.54.
/// - `gridPadding`: Padding for the grid.
///
/// ### Returns
/// Provides style configuration for the books list info template, supporting atomic design system templates.
///
/// ### Example
/// ```dart
/// BooksListInfoTemplateStyle(
///   cardHeight: 220,
///   cardWidth: 160,
///   imageHeight: 120,
///   mainAxisSpacing: 16,
///   crossAxisSpacing: 12,
///   gridPadding: EdgeInsets.all(8),
/// )
/// ```
/// {@endtemplate}
class BooksListInfoTemplateStyle {
  /// {@macro books_list_info_template_style}
  const BooksListInfoTemplateStyle({
    this.cardHeight,
    this.cardWidth,
    this.cardBorderRadius = 16,
    this.imageBorderRadius,
    this.imageErrorPlaceholder,
    this.imageHeight,
    this.imagePlaceholder,
    this.imagePosition = CardImagePosition.top,
    this.imageWidth,
    this.paddingContent,
    this.paddingImage,
    this.paddingDescription,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio = 0.54,
    this.gridPadding,
  });

  /// Height of each card.
  final double? cardHeight;
  /// Width of each card.
  final double? cardWidth;
  /// Border radius of each card. Defaults to 16.
  final double cardBorderRadius;
  /// Border radius for the image.
  final BorderRadiusGeometry? imageBorderRadius;
  /// Widget to show if the image fails to load.
  final Widget? imageErrorPlaceholder;
  /// Height of the image.
  final double? imageHeight;
  /// Widget to show while the image is loading.
  final Widget? imagePlaceholder;
  /// Position of the image in the card.
  final CardImagePosition imagePosition;
  /// Width of the image.
  final double? imageWidth;
  /// Padding for the content inside the card.
  final EdgeInsetsGeometry? paddingContent;
  /// Padding for the image.
  final EdgeInsetsGeometry? paddingImage;
  /// Padding for the description.
  final EdgeInsetsGeometry? paddingDescription;
  /// Main axis spacing in the grid.
  final double? mainAxisSpacing;
  /// Cross axis spacing in the grid.
  final double? crossAxisSpacing;
  /// Aspect ratio of grid children. Defaults to 0.54.
  final double childAspectRatio;
  /// Padding for the grid.
  final EdgeInsetsGeometry? gridPadding;
}
