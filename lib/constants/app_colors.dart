import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);

  static const Color darkBackground = black;
  static const Color lightBackground = white;

  static const Color darkCard = black;
  static const Color lightCard = white;

  // Text
  static const Color textPrimaryDark = white;
  static const Color textPrimaryLight = black;
  static const Color textSecondary = Color(0xFFA0A0A0);

  static const Color darkbuttonOverlay = Color.fromRGBO(
    0,
    0,
    0,
    .5,
  ); // black 50%
  static const Color lightbuttonOverlay = Color.fromRGBO(
    255,
    255,
    255,
    0.5,
  ); // white 50%

  static const Color strokeLight = black; // light theme stroke = black
  static const Color strokeDark = white; // dark theme stroke = white
}
