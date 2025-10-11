import 'package:book_stack_design_system/designs/atomic/molecules/header/header_base.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderModule extends StatelessWidget {
  const HeaderModule({
    super.key,
    required this.title,
    this.onBack,
  });

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return HeaderBase(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: BookStackAssets.lib.assets.icons.arrowLeft.svg(
                    color: colorScheme.onBackground,
                    width: BookStackScreenSize.width(context, 24),
                    height: BookStackScreenSize.height(context, 24),
                  ),
                  onPressed: onBack,
                  tooltip: 'Atras',
                ),
                Gap(BookStackScreenSize.width(context, 4)),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
