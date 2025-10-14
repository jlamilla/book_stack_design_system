import 'package:flutter/material.dart';

/// {@template scaffold_book_stack}
/// A [ScaffoldBookStack] template for the Book Stack Design System.
/// Provides a scaffold layout with a fixed header and customizable body and background color.
///
/// ### Atomic Level
/// **Template** – Page-level layout in the Atomic Design System.
///
/// ### Parameters
/// - `header`: The header widget displayed at the top of the scaffold.
/// - `background`: Optional background color for the scaffold.
/// - `body`: The main body widget displayed below the header.
///
/// ### Returns
/// Renders a scaffold with a fixed header and customizable body, suitable for atomic design system templates.
///
/// ### Example
/// ```dart
/// ScaffoldBookStack(
///   header: MyHeaderWidget(),
///   body: MyBodyWidget(),
///   background: Colors.white,
/// )
/// ```
/// {@endtemplate}
class ScaffoldBookStack extends StatelessWidget {
  /// {@macro scaffold_book_stack}
  const ScaffoldBookStack({
    super.key,
    required this.header,
    this.background,
    required this.body,
  });

  /// The header widget displayed at the top of the scaffold.
  final Widget header;
  /// Optional background color for the scaffold.
  final Color? background;
  /// The main body widget displayed below the header.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: background ?? Theme.of(context).colorScheme.background,
        body: Stack(
          children: <Widget>[
            body,
            Positioned(top: 0, left: 0, right: 0, child: header),
          ],
        ),
      ),
    );
  }
}
