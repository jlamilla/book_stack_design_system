import 'package:book_stack_design_system/designs/atomic/molecules/header/header_base.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    this.onToggleTheme,
    this.onSearch,
  });

  final VoidCallback? onToggleTheme;
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return HeaderBase(
      child: Row(
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
                      color: colorScheme.surface,
                    )
                    : BookStackAssets.lib.assets.icons.moon.svg(
                      color: colorScheme.surface,
                    ),
                  onPressed: onToggleTheme,
                  tooltip: 'Cambiar tema',
                ),
                Gap(BookStackScreenSize.width(context, 4)),
                IconButton(
                  icon: BookStackAssets.lib.assets.icons.search.svg(
                    color: colorScheme.surface,
                  ),
                  onPressed: onSearch,
                  tooltip: 'Buscar',
                ),
              ],
            ),
          ],
        ),
    );
  }
}
