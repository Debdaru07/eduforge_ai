import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../fonts/text_theme.dart';

class EduForgeTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: EduForgePalette.white,
    textTheme: satoshiTextTheme,
    primaryColor: EduForgePalette.grey600,
    appBarTheme: AppBarTheme(
      backgroundColor: EduForgePalette.white,
      foregroundColor: EduForgePalette.black,
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: EduForgePalette.darkBackground,
    textTheme: satoshiTextTheme,
    primaryColor: EduForgePalette.offWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: EduForgePalette.darkGrey,
      foregroundColor: EduForgePalette.white,
      elevation: 0,
    ),
  );
}
