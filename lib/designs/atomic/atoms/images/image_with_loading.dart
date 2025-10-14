import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// {@template image_with_loading}
/// An [ImageWithLoading] atom for the Book Stack Design System.
/// Displays a network image with loading and error placeholders, supporting custom sizing, border radius, and fit.
/// 
/// ### Atomic Level
/// **Atom** – Smallest UI unit in the Atomic Design System.
/// 
/// ### Parameters
/// - `url`: The main image URL for the card.
/// - `height`: The height of the image. Defaults to full height.
/// - `width`: The width of the image. Defaults to full width.
/// - `placeholder`: Widget to show while the image is loading. Defaults to [SkeletonCard].
/// - `errorPlaceholder`: Widget to show if the image fails to load. Defaults to [SkeletonCard].
/// - `borderRadius`: The border radius for the image. Defaults to top corners rounded.
/// - `boxFit`: How to inscribe the image into the space allocated during layout.
/// 
/// ### Returns
/// Renders a network image with loading and error states, clipped to the specified border radius and sized as provided.
/// 
/// ### Example
/// ```dart
/// const ImageWithLoading(
///   url: 'https://example.com/image.jpg',
///   height: 120,
///   width: 120,
///   borderRadius: BorderRadius.all(Radius.circular(16)),
/// );
/// ```
/// {@endtemplate}
class ImageWithLoading extends StatelessWidget {
  /// {@macro image_with_loading}
  const ImageWithLoading({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.placeholder,
    this.errorPlaceholder,
    this.borderRadius,
    this.boxFit = BoxFit.cover,
  });

  /// The main image URL for the card.
  final String url;

  /// The height of the image. Defaults to full height.
  final double? height;

  /// The width of the image. Defaults to full width.
  final double? width;

  /// Widget to show while the image is loading. Defaults to [SkeletonCard].
  final Widget? placeholder;

  /// Widget to show if the image fails to load. Defaults to [SkeletonCard].
  final Widget? errorPlaceholder;

  /// The border radius for the image. Defaults to top corners rounded.
  final BorderRadiusGeometry? borderRadius;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (BuildContext context, String url) => placeholder ?? const SkeletonCard(),
          errorWidget: (BuildContext context, String url, Object error) =>
            errorPlaceholder ?? BookStackAssets.lib.assets.images.notImage.image(
              package: 'book_stack_design_system',
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          fit: boxFit,
        ),
      ),
    );
  }
}
