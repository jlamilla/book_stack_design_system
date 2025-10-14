import 'package:book_stack_design_system/designs/atomic/atoms/texts/book_stack_text.dart';
import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// {@template rating_star}
/// A [RatingStar] molecule for the Book Stack Design System.
/// Displays a star-based rating widget with interactive selection and general rating display.
///
/// ### Atomic Level
/// **Molecule** – Composed UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `globalRating`: The general rating value to display (out of 5).
/// - `localRating`: The user's selected rating (optional).
/// - `onRatingChange`: Callback triggered when the user selects a rating.
///
/// ### Returns
/// Renders a star rating row with interactive selection, user rating, and general rating display for atomic design systems.
///
/// ### Example
/// ```dart
/// RatingStar(
///   globalRating: 4,
///   localRating: 3,
///   onRatingChange: (rating) {
///     // Handle rating change
///   },
/// )
/// ```
/// {@endtemplate}
class RatingStar extends StatelessWidget {
  /// {@macro rating_star}
  const RatingStar({
    super.key,
    required this.globalRating,
    this.localRating,
    required this.onRatingChange,
  });

  /// The general rating value to display (out of 5).
  final int globalRating;
  /// The user's selected rating (optional).
  final int? localRating;
  /// Callback triggered when the user selects a rating.
  final void Function(int rating) onRatingChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(BookStackScreenSize.radius(context, 8)),
      ),
      padding: BookStackScreenSize.all(context, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BookStackText(
            text: localRating != null ? 'Your Rating' : 'Rate this book',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(BookStackScreenSize.height(context, 8)),
          Row(
            children: List<Widget>.generate(5, (int index) {
              return IconButton(
                icon: BookStackAssets.lib.assets.icons.star.svg(
                  package: 'book_stack_design_system',
                  color: index < (localRating ?? 0) ? BookStackTheme.ratingStarColor : BookStackTheme.iconColor(context),
                  width: BookStackScreenSize.width(context, 27),
                  height: BookStackScreenSize.width(context, 27),
                ),
                onPressed: () => onRatingChange.call(index + 1),
                iconSize: 28,
                splashRadius: 20,
              );
            }),
          ),
          Gap(BookStackScreenSize.height(context, 8)),
          BookStackText(
            text: 'General rating: $globalRating/5',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
