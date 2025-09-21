// theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// LIGHT THEME
final ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.yellow.shade800,
  brightness: Brightness.light,
);

final ThemeData salonLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.yellow.shade800,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: Colors.yellow.shade800,
    unselectedLabelColor: Colors.black54,
    indicatorColor: Colors.yellow.shade800,
    labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.inter(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow.shade800,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey.shade200,
    selectedColor: Colors.yellow.shade800,
    labelStyle: GoogleFonts.inter(color: Colors.black),
    secondaryLabelStyle: GoogleFonts.inter(color: Colors.black),
    brightness: Brightness.light,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
);

// DARK THEME
final ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.yellow.shade800,
  brightness: Brightness.dark,
);

final ThemeData salonDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: Colors.black,
  textTheme: GoogleFonts.interTextTheme().apply(
    bodyColor: Colors.yellow.shade800,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.yellow.shade800,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: Colors.yellow.shade800,
    unselectedLabelColor: Colors.white70,
    indicatorColor: Colors.yellow.shade800,
    labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.inter(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow.shade800,
      foregroundColor: Colors.black,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey.shade800,
    selectedColor: Colors.yellow.shade800,
    labelStyle: GoogleFonts.inter(color: Colors.white),
    secondaryLabelStyle: GoogleFonts.inter(color: Colors.white),
    brightness: Brightness.dark,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
);
