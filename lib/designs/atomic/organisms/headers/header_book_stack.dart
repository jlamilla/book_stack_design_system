import 'dart:ui';

import 'package:book_stack_design_system/designs/atomic/theme/book_stack_theme.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum HeaderType { home, module, search }

/// {@template header_book_stack}
/// A [HeaderBookStack] organism for the Book Stack Design System.
/// Displays a customizable header bar for home, module, or search screens, supporting theme toggling, navigation, and search actions.
///
/// ### Atomic Level
/// **Organism** – Complex UI unit in the Atomic Design System.
///
/// ### Parameters
/// - `type`: The header type (home, module, search).
/// - `title`: The title text for module headers.
/// - `textSearch`: Widget for search input in search headers.
/// - `onBack`: Callback executed when the back button is pressed.
/// - `onToggleTheme`: Callback executed when the theme toggle button is pressed.
/// - `onSearch`: Callback executed when the search button is pressed.
///
/// ### Returns
/// Renders a header bar with customizable layout, theme toggling, navigation, and search actions for atomic design systems.
///
/// ### Example
/// ```dart
/// HeaderBookStack(
///   type: HeaderType.home,
///   onToggleTheme: () {},
///   onSearch: () {},
/// )
/// ```
/// {@endtemplate}
class HeaderBookStack extends StatelessWidget implements PreferredSizeWidget {

  /// {@macro header_book_stack}
  const HeaderBookStack({
    super.key,
    required this.type,
    this.title,
    this.textSearch = const SizedBox.shrink(),
    this.onBack,
    this.onToggleTheme,
    this.onSearch,
  });

  /// The header type (home, module, search).
  final HeaderType type;
  /// The title text for module headers.
  final String? title;
  /// Widget for search input in search headers.
  final Widget textSearch;
  /// Callback executed when the back button is pressed.
  final VoidCallback? onBack;
  /// Callback executed when the theme toggle button is pressed.
  final VoidCallback? onToggleTheme;
  /// Callback executed when the search button is pressed.
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color iconColor = BookStackTheme.iconColor(context);

    Widget content;
    switch (type) {
      case HeaderType.home:
        content = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Book',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: BookStackScreenSize.fontSize(context, 24),
                      color: colorScheme.onBackground,
                    ),
                  ),
                  TextSpan(
                    text: 'Stack',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: BookStackScreenSize.fontSize(context, 24),
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: isDarkMode
                      ? BookStackAssets.lib.assets.icons.sun.svg(
                        package: 'book_stack_design_system',
                          color: iconColor,
                        )
                      : BookStackAssets.lib.assets.icons.moon.svg(
                          package: 'book_stack_design_system',
                          color: iconColor,
                        ),
                  onPressed: onToggleTheme,
                  tooltip: 'Cambiar tema',
                ),
                Gap(BookStackScreenSize.width(context, 4)),
                IconButton(
                  icon: BookStackAssets.lib.assets.icons.search.svg(
                    package: 'book_stack_design_system',
                    color: iconColor,
                  ),
                  onPressed: onSearch,
                  tooltip: 'Buscar',
                ),
              ],
            ),
          ],
        );
      case HeaderType.module:
        content = Row(
          children: <Widget>[
            IconButton(
              icon: BookStackAssets.lib.assets.icons.arrowLeft.svg(
                package: 'book_stack_design_system',
                color: iconColor,
                width: BookStackScreenSize.width(context, 24),
                height: BookStackScreenSize.height(context, 24),
              ),
              onPressed: onBack,
              tooltip: 'Back',
            ),
            Expanded(
              child: Text(
                title ?? 'Title module',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      case HeaderType.search:
        content = Row(
          children: <Widget>[
            IconButton(
              icon: BookStackAssets.lib.assets.icons.arrowLeft.svg(
                color: iconColor,
                package: 'book_stack_design_system',
                width: BookStackScreenSize.width(context, 24),
                height: BookStackScreenSize.height(context, 24),
              ),
              onPressed: onBack,
              tooltip: 'Atras',
            ),
            Gap(BookStackScreenSize.width(context, 4)),
            Expanded(
              child: textSearch,
            ),
          ],
        );
    }

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          height: BookStackScreenSize.height(context, 56) + MediaQuery.of(context).padding.top,
          width: double.infinity,
          padding: BookStackScreenSize.symmetric(
            context,
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: colorScheme.background.withOpacity(0.60),
            border: Border(
              bottom: BorderSide(
                color: isDarkMode
                    ? colorScheme.onSurface.withOpacity(0.2)
                    : colorScheme.onSurface.withOpacity(0.1),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: content,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65.0);
}
