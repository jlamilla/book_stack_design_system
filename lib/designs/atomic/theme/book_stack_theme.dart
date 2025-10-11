

import 'package:book_stack_design_system/designs/atomic/tokens/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookStackTheme {
  ThemeData lightTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: BookStackColors.lightAccent,
      onPrimary: BookStackColors.lightCardSurface,
      secondary: BookStackColors.lightCardSurface,
      onSecondary: BookStackColors.lightTextPrimary,
      background: BookStackColors.lightPrimaryBackground,
      onBackground: BookStackColors.lightTextPrimary,
      surface: BookStackColors.lightCardSurface,
      onSurface: BookStackColors.lightTextSecondary,
      error: BookStackColors.red500,
      onError: BookStackColors.lightCardSurface,
    ),
    scaffoldBackgroundColor: BookStackColors.lightAppBackground,
    textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: BookStackColors.lightAppBackground,
      foregroundColor: BookStackColors.lightTextPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BookStackColors.lightAccent,
      foregroundColor: BookStackColors.lightCardSurface,
    ),
  );

  ThemeData darkTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: BookStackColors.darkAccent,
      onPrimary: BookStackColors.darkCardSurface,
      secondary: BookStackColors.yellow400,
      onSecondary: BookStackColors.darkCardSurface,
      background: BookStackColors.darkPrimaryBackground,
      onBackground: BookStackColors.darkTextPrimary,
      surface: BookStackColors.darkCardSurface,
      onSurface: BookStackColors.darkTextSecondary,
      error: BookStackColors.red500,
      onError: BookStackColors.darkCardSurface,
    ),
    scaffoldBackgroundColor: BookStackColors.darkAppBackground,
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: BookStackColors.darkAppBackground,
      foregroundColor: BookStackColors.darkTextPrimary,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BookStackColors.darkAccent,
      foregroundColor: BookStackColors.darkCardSurface,
    ),
  );
}
