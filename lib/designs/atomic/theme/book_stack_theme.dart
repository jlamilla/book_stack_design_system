import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template book_stack_theme}
/// [BookStackTheme] for the Book Stack Design System.
/// Provides centralized theme configuration, color tokens, and text styles for light and dark modes, integrating Google Fonts and design tokens.
///
/// ### Overview
/// This class defines the core theme for the Book Stack Design System, including color schemes, text styles, input decoration, and integration with Google Fonts. It supports both light and dark modes and ensures consistency across all atomic, molecular, and organism components.
///
/// ### Atomic Level
/// **Theme** – Foundational configuration for all Atomic Design System layers.
///
/// ### Integration
/// - Use `BookStackTheme.lightTheme()` and `BookStackTheme.darkTheme()` in your `MaterialApp` or `ThemeData` setup.
/// - All design tokens (colors, font sizes, etc.) are referenced from `BookStackColors` and Google Fonts.
/// - Text styles are mapped to atomic tokens and can be used in widgets via `Theme.of(context).textTheme`.
/// - Input decoration themes are provided for consistent form styling.
/// - Icon colors are dynamically selected based on brightness using `BookStackTheme.iconColor(context)`.
///
/// ### Example
/// ```dart
/// MaterialApp(
///   theme: BookStackTheme().lightTheme(),
///   darkTheme: BookStackTheme().darkTheme(),
/// )
/// ```
/// {@endtemplate}
class BookStackTheme {
  /// Common color tokens for the design system.
  static const Color favoriteColor = BookStackColors.red500;
  static const Color ratingStarColor = BookStackColors.yellow400;
  static const Color lightIconColor = BookStackColors.lightIcon;
  static const Color darkIconColor = BookStackColors.darkIcon;
  /// The font family used throughout the design system (Google Fonts Inter).
  static String fontFamily = GoogleFonts.inter().fontFamily!;

  /// Input decoration theme for consistent form field styling.
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    iconColor: lightIconColor,
    filled: true,
    fillColor: BookStackColors.lightAppBackground,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: BookStackColors.lightTextSecondary.withOpacity(0.2),
        width: 1,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    hintStyle: const TextStyle(color: BookStackColors.lightTextSecondary),
    prefixIconColor: BookStackColors.lightTextSecondary,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: BookStackColors.lightTextSecondary.withOpacity(0.5),
        width: 1,
      ),
    ),
  );

  /// Returns the light theme configuration for the Book Stack Design System.
  ThemeData lightTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: BookStackColors.lightAccent,
    scaffoldBackgroundColor: BookStackColors.lightAppBackground,
    cardColor: BookStackColors.lightCardSurface,
    colorScheme: const ColorScheme.light(
      primary: BookStackColors.lightAccent,
      onPrimary: BookStackColors.lightCardSurface,
      secondary: BookStackColors.lightTextSecondary,
      onSecondary: BookStackColors.lightTextPrimary,
      background: BookStackColors.lightPrimaryBackground,
      onBackground: BookStackColors.lightTextPrimary,
      surface: BookStackColors.lightCardSurface,
      onSurface: BookStackColors.lightTextSecondary,
      error: BookStackColors.red500,
      onError: BookStackColors.lightCardSurface,
    ),
    fontFamily: fontFamily,
  /// Text styles for light mode, mapped to atomic tokens.
  textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.lightTextPrimary,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.lightTextPrimary,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color: BookStackColors.lightTextSecondary,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.lightAccent,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.lightTextPrimary,
        fontFamily: fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        height: 1.6,
        color: BookStackColors.lightTextSecondary,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.lightTextPrimary,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.lightTextSecondary,
        fontFamily: fontFamily,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.lightTextSecondary,
        fontFamily: fontFamily,
      ),
    ),
  /// Primary text styles for light mode.
  primaryTextTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.lightAccent,
        fontFamily: fontFamily,
      ),
    ),
  /// AppBar theme for light mode.
  appBarTheme: const AppBarTheme(
      backgroundColor: BookStackColors.lightAppBackground,
      foregroundColor: BookStackColors.lightTextPrimary,
      elevation: 0,
    ),
  /// Dropdown menu theme for light mode.
  dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: inputDecorationTheme.copyWith(
        fillColor: BookStackColors.lightCardSurface,
      ),
      textStyle: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.lightTextPrimary,
        fontFamily: fontFamily,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(BookStackColors.lightCardSurface),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: BookStackColors.lightTextSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size.infinite),
      ),
    ),
  /// Floating action button theme for light mode.
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BookStackColors.lightAccent,
      foregroundColor: BookStackColors.lightCardSurface,
    ),
  /// Input decoration theme for light mode.
  inputDecorationTheme: inputDecorationTheme,
  );

  /// Returns the dark theme configuration for the Book Stack Design System.
  ThemeData darkTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: BookStackColors.darkAccent,
    scaffoldBackgroundColor: BookStackColors.darkAppBackground,
    cardColor: BookStackColors.darkCardSurface,
    colorScheme: const ColorScheme.dark(
      primary: BookStackColors.darkAccent,
      onPrimary: BookStackColors.darkCardSurface,
      secondary: BookStackColors.darkTextSecondary,
      onSecondary: BookStackColors.darkTextPrimary,
      background: BookStackColors.darkPrimaryBackground,
      onBackground: BookStackColors.darkTextPrimary,
      surface: BookStackColors.darkCardSurface,
      onSurface: BookStackColors.darkTextSecondary,
      error: BookStackColors.red500,
      onError: BookStackColors.darkCardSurface,
    ),
    fontFamily: fontFamily,
  /// Text styles for dark mode, mapped to atomic tokens.
  textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.darkTextPrimary,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.darkTextPrimary,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color: BookStackColors.darkTextSecondary,
        fontFamily: fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.darkAccent,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.darkTextPrimary,
        fontFamily: fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        height: 1.6,
        color: BookStackColors.darkTextSecondary,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.darkTextPrimary,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.darkTextSecondary,
        fontFamily: fontFamily,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: BookStackColors.darkTextSecondary,
        fontFamily: fontFamily,
      ),
    ),
  /// Primary text styles for dark mode.
  primaryTextTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        color: BookStackColors.darkAccent,
        fontFamily: fontFamily,
      ),
    ),
  /// AppBar theme for dark mode.
  appBarTheme: const AppBarTheme(
      backgroundColor: BookStackColors.darkAppBackground,
      foregroundColor: BookStackColors.darkTextPrimary,
      elevation: 0,
    ),
  /// Dropdown menu theme for dark mode.
  dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: inputDecorationTheme.copyWith(
        iconColor: darkIconColor,
        filled: true,
        fillColor: BookStackColors.darkCardSurface,
        hintStyle: const TextStyle(color: BookStackColors.darkTextSecondary),
        prefixIconColor: BookStackColors.darkTextSecondary,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: BookStackColors.darkTextSecondary.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: BookStackColors.darkTextSecondary.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      textStyle: TextStyle(
        fontSize: 14.0,
        color: BookStackColors.darkTextPrimary,
        fontFamily: fontFamily,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(BookStackColors.darkCardSurface),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: BookStackColors.darkTextSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size.infinite),
      ),
    ),
  /// Floating action button theme for dark mode.
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BookStackColors.darkAccent,
      foregroundColor: BookStackColors.darkCardSurface,
    ),
  /// Input decoration theme for dark mode.
  inputDecorationTheme: inputDecorationTheme.copyWith(
      iconColor: darkIconColor,
      filled: true,
      fillColor: BookStackColors.darkAppBackground,
      hintStyle: const TextStyle(color: BookStackColors.darkTextSecondary),
      prefixIconColor: BookStackColors.darkTextSecondary,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: BookStackColors.darkTextSecondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: BookStackColors.darkTextSecondary.withOpacity(0.5),
          width: 1,
        ),
      ),
    ),
  );

  /// Returns the appropriate icon color based on the current theme brightness.
  static Color iconColor(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? BookStackColors.darkIcon : BookStackColors.lightIcon;
  }
}
