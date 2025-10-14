import 'package:flutter/material.dart';

/// {@template book_details_template_style}
/// A [BookDetailsTemplateStyle] template for the Book Stack Design System.
/// Provides style configuration for the book details template, including paddings, gaps, sizes, and colors for all major sections.
///
/// ### Atomic Level
/// **Template** – Page-level layout in the Atomic Design System.
///
/// ### Parameters
/// - `screenPadding`: Main screen padding.
/// - `cardPadding`: Card padding.
/// - `cardShadowColor`: Card shadow color.
/// - `cardShadowBlurRadius`: Card shadow blur radius.
/// - `imageWidth`: Image width.
/// - `imageHeight`: Image height.
/// - `imagePadding`: Image padding.
/// - `titleGap`: Gap below the title.
/// - `authorGap`: Gap below the author.
/// - `favoriteIconSize`: Size of the favorite icon.
/// - `favoriteIconContainerPadding`: Padding for the favorite icon container.
/// - `favoriteIconPadding`: Padding for the favorite icon.
/// - `priceGap`: Gap below the price.
/// - `priceFontSize`: Font size for the price.
/// - `infoItemGap`: Gap between info items.
/// - `descriptionGap`: Gap below the description.
/// - `downloadsGap`: Gap below the downloads section.
/// - `downloadButtonIconSize`: Size of the download button icon.
/// - `downloadButtonGap`: Gap below the download button.
/// - `ratingGap`: Gap below the rating section.
///
/// ### Returns
/// Provides style configuration for the book details template, supporting atomic design system templates.
///
/// ### Example
/// ```dart
/// BookDetailsTemplateStyle(
///   screenPadding: EdgeInsets.all(16),
///   cardPadding: EdgeInsets.symmetric(horizontal: 12),
///   imageWidth: 120,
///   imageHeight: 180,
/// )
/// ```
/// {@endtemplate}
class BookDetailsTemplateStyle {
		/// {@macro book_details_template_style}
		const BookDetailsTemplateStyle({
		this.screenPadding,
		this.cardPadding = EdgeInsets.zero,
		this.cardShadowColor,
		this.cardShadowBlurRadius = 16.0,
		this.imageWidth,
		this.imageHeight,
		this.imagePadding,
		this.titleGap = 4.0,
		this.authorGap = 25.0,
		this.favoriteIconPadding,
		this.favoriteIconSize = 27.0,
		this.favoriteIconContainerPadding = 15.0,
		this.priceGap = 12.0,
		this.priceFontSize = 28.0,
		this.infoItemGap = 8.0,
		this.descriptionGap = 16.0,
		this.downloadsGap = 24.0,
		this.downloadButtonIconSize = 20.0,
		this.downloadButtonGap = 8.0,
		this.ratingGap = 24.0,
	});

		/// Main screen padding.
		final EdgeInsetsGeometry? screenPadding;
		/// Card padding.
		final EdgeInsetsGeometry cardPadding;
		/// Card shadow color.
		final Color? cardShadowColor;
		/// Card shadow blur radius.
		final double cardShadowBlurRadius;
		/// Image width.
		final double? imageWidth;
		/// Image height.
		final double? imageHeight;
		/// Image padding.
		final EdgeInsetsGeometry? imagePadding;
		/// Gap below the title.
		final double titleGap;
		/// Gap below the author.
		final double authorGap;
		/// Size of the favorite icon.
		final double favoriteIconSize;
		/// Padding for the favorite icon container.
		final double favoriteIconContainerPadding;
		/// Padding for the favorite icon.
		final EdgeInsetsGeometry? favoriteIconPadding;
		/// Gap below the price.
		final double priceGap;
		/// Font size for the price.
		final double priceFontSize;
		/// Gap between info items.
		final double infoItemGap;
		/// Gap below the description.
		final double descriptionGap;
		/// Gap below the downloads section.
		final double downloadsGap;
		/// Size of the download button icon.
		final double downloadButtonIconSize;
		/// Gap below the download button.
		final double downloadButtonGap;
		/// Gap below the rating section.
		final double ratingGap;
}
