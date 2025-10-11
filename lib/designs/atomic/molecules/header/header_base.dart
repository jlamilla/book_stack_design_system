import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';

class HeaderBase extends StatelessWidget {

  const HeaderBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: BookStackScreenSize.height(context, 56),
      width: double.infinity,
      padding: BookStackScreenSize.symmetric(
        context,
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: isDarkMode ? colorScheme.onSurface.withOpacity(0.2) : colorScheme.onSurface.withOpacity(0.1),
          ),
        ),
      ),
      child: child
    );
  }
}
