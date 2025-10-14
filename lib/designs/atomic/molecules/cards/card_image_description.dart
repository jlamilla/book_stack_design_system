import 'package:book_stack_design_system/designs/atomic/atoms/cards/card_base.dart';
import 'package:book_stack_design_system/designs/atomic/atoms/images/image_with_loading.dart';
import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// {@template card_image_description}
/// A [CardImageDescription] molecule for the Book Stack Design System.
/// Displays a card with an image, description, and optional floating tag widget, supporting multiple image positions and design tokens for sizing and border radius.
///
/// ### Atomic Level
/// **Molecule** – Composed UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `cardWidth`: The width of the card. If null, expands to parent constraints.
/// - `cardHeight`: The height of the card. If null, expands to parent constraints.
/// - `cardBorderRadius`: The border radius of the card. Defaults to 16.
/// - `imageUrl`: The main image URL for the card.
/// - `imageHeight`: The height of the image. Defaults to 160.
/// - `imageWidth`: The width of the image. Defaults to full width.
/// - `imageBorderRadius`: The border radius for the image. Defaults to top corners rounded.
/// - `imagePlaceholder`: Widget to show while the image is loading. Defaults to [SkeletonCard].
/// - `imageErrorPlaceholder`: Widget to show if the image fails to load. Defaults to [SkeletonCard].
/// - `description`: The main description widget below the image.
/// - `paddingContent`: Padding for the content inside the card.
/// - `imagePosition`: The position of the image in the card (top, left, right).
/// - `paddingImage`: Padding for the image.
/// - `paddingDescription`: Padding for the description.
///
/// ### Returns
/// Renders a card with an image and description, supporting multiple layouts and design tokens for atomic design systems.
///
/// ### Example
/// ```dart
/// CardImageDescription(
///   cardWidth: 320,
///   cardHeight: 220,
///   cardBorderRadius: 24,
///   imageUrl: 'https://example.com/image.jpg',
///   imageHeight: 160,
///   imageBorderRadius: BorderRadius.only(
///     topLeft: Radius.circular(22),
///     topRight: Radius.circular(22),
///   ),
///   description: Text('Some description'),
///   paddingContent: EdgeInsets.all(8),
/// )
/// ```
/// {@endtemplate}
enum CardImagePosition { top, left, right }

class CardImageDescription extends StatelessWidget {
  /// {@macro card_image_description}
  const CardImageDescription({
    super.key,
    this.cardWidth,
    this.cardHeight,
    this.cardBorderRadius = 16,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.imageBorderRadius,
    this.imagePlaceholder,
    this.imageErrorPlaceholder,
    required this.description,
    this.paddingContent,
    this.imagePosition = CardImagePosition.top,
    this.paddingImage,
    this.paddingDescription,
  });

  /// The width of the card. If null, expands to parent constraints.
  final double? cardWidth;

  /// The height of the card. If null, expands to parent constraints.
  final double? cardHeight;

  /// The border radius of the card. Defaults to 16.
  final double cardBorderRadius;

  /// The main image URL for the card.
  final String imageUrl;

  /// The height of the image. Defaults to 160.
  final double? imageHeight;

  /// The width of the image. Defaults to full width.
  final double? imageWidth;

  /// Widget to show while the image is loading. Defaults to [SkeletonCard].
  final Widget? imagePlaceholder;

  /// Widget to show if the image fails to load. Defaults to [SkeletonCard].
  final Widget? imageErrorPlaceholder;

  /// The border radius for the image. Defaults to top corners rounded.
  final BorderRadiusGeometry? imageBorderRadius;

  /// The main description widget below the image.
  final Widget description;

  /// Padding for the content inside the card.
  final EdgeInsetsGeometry? paddingContent;

  /// The position of the image in the card (top, left, right).
  final CardImagePosition imagePosition;

  /// Padding for the image.
  final EdgeInsetsGeometry? paddingImage;

  /// Padding for the description.
  final EdgeInsetsGeometry? paddingDescription;

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (imagePosition) {
      case CardImagePosition.top:
        content = Column(
          children: <Widget>[
            Padding(
              padding: paddingImage ?? EdgeInsets.zero,
              child: ImageWithLoading(
                url: imageUrl,
                height: BookStackScreenSize.height(context, 160),
                width: imageWidth ?? double.infinity,
                borderRadius: imageBorderRadius ?? BorderRadius.all(
                  Radius.circular(BookStackScreenSize.radius(context, cardBorderRadius)),
                ),
              ),
            ),
            Gap(BookStackScreenSize.height(context, 24)),
            Padding(
              padding: paddingDescription ?? EdgeInsets.zero,
              child: description,
            ),
          ],
        );
      case CardImagePosition.left:
        content = Row(
          children: <Widget>[
            Padding(
              padding: paddingImage ?? EdgeInsets.zero,
              child: ImageWithLoading(
                url: imageUrl,
                height: BookStackScreenSize.height(context, 160),
                width: imageWidth,
                borderRadius: imageBorderRadius ?? BorderRadius.only(
                  topLeft: Radius.circular(BookStackScreenSize.radius(context, cardBorderRadius - 2)),
                  topRight: Radius.circular(BookStackScreenSize.radius(context, cardBorderRadius - 2)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: paddingDescription ?? EdgeInsets.zero,
                child: description,
              ),
            ),
          ],
        );
      case CardImagePosition.right:
        content = Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: paddingDescription ?? EdgeInsets.zero,
                child: description,
              ),
            ),
            Padding(
              padding: paddingImage ?? EdgeInsets.zero,
              child: ImageWithLoading(
                url: imageUrl,
                height: BookStackScreenSize.height(context, 160),
                width: imageWidth,
                borderRadius: imageBorderRadius ?? BorderRadius.only(
                  topLeft: Radius.circular(BookStackScreenSize.radius(context, cardBorderRadius - 2)),
                  topRight: Radius.circular(BookStackScreenSize.radius(context, cardBorderRadius - 2)),
                ),
              ),
            ),
          ],
        );
    }
    return CardBase(
      width: cardWidth,
      height: cardHeight,
      borderRadius: cardBorderRadius,
      padding: paddingContent ?? BookStackScreenSize.symmetric(context, horizontal: 16),
      child: content,
    );
  }
}
