import 'package:book_stack_design_system/designs/atomic/atoms/inputs/book_stack_search_bar.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/header/header_base.dart';
import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/assets.gen.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderSearchBar extends StatelessWidget {
  const HeaderSearchBar({
    super.key,
    this.onBack,
    this.controller,
    this.onChanged,
  });

  /// Callback when the back button is pressed.
  final VoidCallback? onBack;

  /// Optional controller to manage the text being edited.
  final TextEditingController? controller;

  /// Called when the text in the search bar changes.
  final ValueChanged<String>? onChanged;

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
                  child: BookStackSearchBar(
                    controller: controller,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
