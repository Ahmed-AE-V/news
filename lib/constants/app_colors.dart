import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // The app really only has two base colors — everything else is
  // black/white at different opacities.
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);

  // Scaffold backgrounds
  static const Color darkBackground = black;
  static const Color lightBackground = white;

  // Surfaces / cards (same as scaffold — cards are just black/white blocks)
  static const Color darkCard = black;
  static const Color lightCard = white;

  // Text
  static const Color textPrimaryDark = white;
  static const Color textPrimaryLight = black;
  static const Color textSecondary = Color(0xFFA0A0A0); // same in both themes

  // Buttons (e.g. "View All" pill) — black at 50% opacity over any surface
  static const Color buttonOverlay = Color(0x80000000); // black 50%

  // Strokes / borders — flips per theme
  static const Color strokeLight = black; // light theme stroke = black
  static const Color strokeDark = white; // dark theme stroke = white
}
