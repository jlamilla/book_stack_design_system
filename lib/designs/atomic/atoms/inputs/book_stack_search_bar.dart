import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

/// {@template subscription_search_bar}
/// A search bar widget for entering and filtering subscription queries.
///
/// This widget displays a styled [TextField] with a search icon and a customizable
/// [onChanged] callback. It can be controlled externally via a [TextEditingController].
///
/// Example usage:
/// ```dart
/// SubscriptionSearchBar(
///   controller: myController,
///   onChanged: (value) {
///     // Handle search input
///   },
/// )
/// ```
/// {@endtemplate}
class BookStackSearchBar extends StatefulWidget {
  /// {@macro subscription_search_bar}
  const BookStackSearchBar({super.key, this.controller, this.onChanged});

  /// Optional controller to manage the text being edited.
  final TextEditingController? controller;

  /// Called when the text in the search bar changes.
  final ValueChanged<String>? onChanged;

  @override
  State<BookStackSearchBar> createState() => _BookStackSearchBarState();
}

class _BookStackSearchBarState extends State<BookStackSearchBar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar por titulo...',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: BookStackScreenSize.fontSize(context, 14),
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: BookStackAssets.lib.assets.icons.search.svg(
              width: BookStackScreenSize.width(context, 16),
              height: BookStackScreenSize.height(context, 16),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: BookStackScreenSize.width(context, 42),
            minHeight: BookStackScreenSize.height(context, 42),
            maxWidth: BookStackScreenSize.width(context, 42),
            maxHeight: BookStackScreenSize.height(context, 42),
          ),
          contentPadding: BookStackScreenSize.symmetric(
            context,
            horizontal: 16,
            vertical: 16,
          ),
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        cursorColor: Theme.of(context).colorScheme.onSecondary,
        onChanged: widget.onChanged,
      ),
    );
  }
}
