import 'package:book_stack_design_system/designs/atomic/atoms/texts/book_stack_text.dart';
import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum InformativeComponentType { search, error, addData, custom }

/// {@template informative_component}
/// An [InformativeComponent] molecule for the Book Stack Design System.
/// Displays an informative message with an icon/image, title, and subtitle for search, error, add data, or custom states.
///
/// ### Atomic Level
/// **Molecule** – Composed UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `type`: The informative state type (search, error, addData, custom).
/// - `title`: Optional title text for the informative message.
/// - `subTitle`: Optional subtitle text for additional information.
/// - `textStyle`: Custom text style for title and subtitle.
/// - `padding`: Padding around the informative content.
/// - `image`: Custom image or icon widget for the informative state.
/// - `imageHeight`: Height of the image/icon. Defaults to 200.
/// - `imageWidth`: Width of the image/icon. Defaults to 120.
///
/// ### Returns
/// Renders a centered informative message with icon/image, title, and subtitle, styled for atomic design systems.
///
/// ### Example
/// ```dart
/// InformativeComponent(
///   type: InformativeComponentType.error,
///   title: 'Error loading books',
///   subTitle: 'Please try again later.',
/// )
/// ```
/// {@endtemplate}
class InformativeComponent extends StatelessWidget {
  /// {@macro informative_component}
  const InformativeComponent({
    super.key,
    this.type = InformativeComponentType.search,
    this.title,
    this.subTitle,
    this.textStyle,
    this.padding,
    this.image,
    this.imageHeight = 200,
    this.imageWidth = 120,
  });

  /// The informative state type (search, error, addData, custom).
  final InformativeComponentType type;

  /// Optional title text for the informative message.
  final String? title;

  /// Optional subtitle text for additional information.
  final String? subTitle;

  /// Custom text style for title and subtitle.
  final TextStyle? textStyle;

  /// Padding around the informative content.
  final EdgeInsetsGeometry? padding;

  /// Custom image or icon widget for the informative state.
  final Widget? image;

  /// Height of the image/icon. Defaults to 200.
  final double? imageHeight;

  /// Width of the image/icon. Defaults to 120.
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    final Widget imageWidget;
    final String displayTextTitle;
    final String displayTextSubTitle;

    switch (type) {
      case InformativeComponentType.search:
        imageWidget = BookStackAssets.lib.assets.icons.booksSearch.svg(
          color: BookStackTheme.iconColor(context),
          package: 'book_stack_design_system',
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        );
        displayTextTitle = title ?? 'There are no matches for the search.';
        displayTextSubTitle =
            subTitle ?? 'Try different keywords or check your spelling.';
      case InformativeComponentType.error:
        imageWidget = BookStackAssets.lib.assets.icons.errorBook.svg(
          color: BookStackTheme.iconColor(context),
          package: 'book_stack_design_system',
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        );
        displayTextTitle =
            title ?? 'An error occurred while searching for books.';
        displayTextSubTitle = subTitle ?? 'Please try again later.';
      case InformativeComponentType.addData:
        imageWidget = BookStackAssets.lib.assets.icons.favoriteAdd.svg(
          color: BookStackTheme.iconColor(context),
          package: 'book_stack_design_system',
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.cover,
        );
        displayTextTitle = title ?? 'Add your favorite books.';
        displayTextSubTitle = subTitle ?? '';
      case InformativeComponentType.custom:
        imageWidget = image ?? const SizedBox.shrink();
        displayTextTitle = title ?? '';
        displayTextSubTitle = subTitle ?? '';
    }
    final Widget content = Center(
      child: Padding(
        padding:
            padding ??
            BookStackScreenSize.fromLTRB(context, left: 24, right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            imageWidget,
            Gap(BookStackScreenSize.height(context, 20)),
            BookStackText(
              text: displayTextTitle,
              style: textStyle ?? Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
              overflow: null,
              maxLines: null,
            ),
            Gap(BookStackScreenSize.height(context, 8)),
            Text(
              displayTextSubTitle,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    final Flex? flexParent = context.findAncestorWidgetOfExactType<Flex>();
    if (flexParent != null) {
      return Expanded(child: content);
    } else if (context.findAncestorWidgetOfExactType<SliverToBoxAdapter>() != null) {
      return content;
    } else {
      return content;
    }
  }
}
