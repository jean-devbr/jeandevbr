import 'package:flutter/material.dart';

abstract final class PortfolioColors {
  static const background = Color(0xFF080B12);
  static const surface = Color(0xFF101521);
  static const surfaceRaised = Color(0xFF151C2A);
  static const text = Color(0xFFF4F7FC);
  static const muted = Color(0xFFA1ACBF);
  static const cyan = Color(0xFF65E4F2);
  static const violet = Color(0xFF9C8CFF);
  static const border = Color(0xFF273142);
}

final portfolioTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: PortfolioColors.background,
  colorScheme: const ColorScheme.dark(
    primary: PortfolioColors.cyan,
    secondary: PortfolioColors.violet,
    surface: PortfolioColors.surface,
    onPrimary: PortfolioColors.background,
    onSurface: PortfolioColors.text,
  ),
  fontFamily: 'Arial',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: PortfolioColors.muted, height: 1.7),
    bodyMedium: TextStyle(color: PortfolioColors.muted, height: 1.65),
    titleLarge: TextStyle(
      color: PortfolioColors.text,
      fontWeight: FontWeight.w700,
    ),
  ),
  useMaterial3: true,
);
