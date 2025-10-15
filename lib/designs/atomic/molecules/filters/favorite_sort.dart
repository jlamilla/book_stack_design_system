import 'package:book_stack_design_system/designs/atomic/molecules/buttons/button_text_icon.dart';
import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template favorite_sort}
/// A [FavoriteSort] molecule in the Book Stack Design System.
/// Provides a combined UI for toggling favorites and selecting sort options, typically used in book or item lists.
///
/// ### Atomic Level
/// **Molecule** – Composes atoms for combined behavior.
///
/// ### Parameters
/// - `visibilityFavorite`: Controls the visibility of the favorites button.
/// - `isFavorite`: Indicates whether the favorites state is active.
/// - `onTapFavorites`: Callback when the favorites button is tapped.
/// - `visibilitySorts`: Controls the visibility of the sort dropdown.
/// - `initialSort`: The initially selected sort option.
/// - `sortOptions`: List of available sort options for the dropdown.
/// - `onSortChanged`: Callback when the sort option changes.
///
/// ### Returns
/// Renders a row containing a favorites button and a sort dropdown menu, with responsive padding and layout.
///
/// ### Example
/// ```dart
/// FavoriteSort(
///   visibilityFavorite: true,
///   isFavorite: false,
///   onTapFavorites: () {},
///   visibilitySorts: true,
///   initialSort: 'Title',
///   sortOptions: ['Title', 'Author', 'Date'],
///   onSortChanged: (value) {},
/// )
/// ```
/// {@endtemplate}
class FavoriteSort extends StatelessWidget {
  /// {@macro favorite_sort}
  /// {@macro button_text_icon}
  const FavoriteSort({
    super.key,
    this.visibilityFavorite = true,
    this.isFavorite = false,
    this.onTapFavorites,
    this.visibilitySorts = true,
    this.initialSort,
    this.sortOptions,
    this.onSortChanged,
  });

  /// Controls the visibility of the favorites button.
  final bool visibilityFavorite;

  /// Indicates whether the favorites state is active.
  final bool isFavorite;

  /// Callback when the favorites button is tapped.
  final VoidCallback? onTapFavorites;

  /// Controls the visibility of the sort dropdown.
  final bool visibilitySorts;

  /// The initially selected sort option.
  final String? initialSort;

  /// List of available sort options for the dropdown.
  final List<String>? sortOptions;

  /// Callback when the sort option changes.
  final ValueChanged<String>? onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BookStackScreenSize.fromLTRB(
        context,
        top: 60 + MediaQuery.of(context).padding.top,
        right: 24,
        left: 24,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (visibilityFavorite)
            Padding(
              padding: BookStackScreenSize.fromLTRB(context, right: 16),
              child: ButtonTextIcon(
                width: BookStackScreenSize.width(context, isFavorite ? 130 : 155),
                borderRadius: 8,
                paddingContent: BookStackScreenSize.symmetric(
                  context,
                  horizontal: 16,
                  vertical: 4,
                ),
                height: BookStackScreenSize.height(context, 52),
                type: ButtonTextIconType.custom,
                text: 'Favorites',
                icon: BookStackAssets.lib.assets.icons.heart.svg(
                  package: 'book_stack_design_system',
                  width: BookStackScreenSize.width(context, 27),
                  height: BookStackScreenSize.width(context, 27),
                  color: isFavorite ? BookStackTheme.favoriteColor : BookStackTheme.iconColor(context),
                ),
                onPressed: onTapFavorites,
                backgroundColor: isFavorite ? BookStackTheme.favoriteColor.withOpacity(0.20) : Theme.of(context).cardColor,
              ),
            ),
          if (sortOptions != null && sortOptions!.isNotEmpty && visibilitySorts)
            Expanded(
              child: DropdownMenu<String>(
                initialSelection: initialSort ?? sortOptions!.first,
                inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                  contentPadding: BookStackScreenSize.fromLTRB(
                    context,
                    left: 8,
                    top: 12,
                    bottom: 12,
                  ),
                ),
                onSelected: (String? newValue) {
                  if (newValue != null && onSortChanged != null) {
                    onSortChanged!(newValue);
                  }
                },
                dropdownMenuEntries: sortOptions!.map((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
