import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template book_stack_search}
/// A [BookStackSearch] atom for the Book Stack Design System.
/// Provides a styled search input field for book titles, with clear button and customizable controller, focus, and hint text.
///
/// ### Atomic Level
/// **Atom** – Smallest UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `hintText`: The hint text displayed in the search field.
/// - `controller`: The [TextEditingController] for managing the search input.
/// - `focusNode`: Optional [FocusNode] for controlling focus behavior.
/// - `onTapClear`: Callback triggered when the clear button is pressed.
///
/// ### Returns
/// Renders a search text field with a search icon, clear button, rounded corners, and theme-based styling for book title queries.
///
/// ### Example
/// ```dart
/// BookStackSearch(
///   controller: myController,
///   onTapClear: () => myController.clear(),
/// )
/// ```
/// {@endtemplate}
class BookStackSearch extends StatelessWidget {
  /// {@macro book_stack_search}
  const BookStackSearch({
    super.key,
    this.hintText = 'Search books by title',
    required this.controller,
    this.focusNode,
    required this.onTapClear,
  });

  /// The hint text displayed in the search field.
  final String hintText;
  /// The controller for managing the search input value.
  final TextEditingController controller;
  /// Optional focus node for controlling focus behavior.
  final FocusNode? focusNode;
  /// Callback triggered when the clear button is pressed.
  final VoidCallback onTapClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: BookStackScreenSize.fontSize(context, 18),
      ),
      cursorColor: BookStackTheme.iconColor(context),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: BookStackScreenSize.fontSize(context, 18),
        ),
        prefixIcon: Padding(
          padding: BookStackScreenSize.symmetric(context, vertical: 5.0),
          child: BookStackAssets.lib.assets.icons.search.svg(
            package: 'book_stack_design_system',
            color: BookStackTheme.iconColor(context),
          ),
        ),
        suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              padding: BookStackScreenSize.symmetric(context, vertical: 5.0),
              icon: Icon(
                Icons.clear,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: onTapClear,
            )
          : null,
        contentPadding: BookStackScreenSize.symmetric(context, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
