import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../fonts/text_theme.dart';

class AspirantsTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AspirantsAIPalette.white,
    textTheme: satoshiTextTheme,
    primaryColor: AspirantsAIPalette.grey600,
    appBarTheme: AppBarTheme(
      backgroundColor: AspirantsAIPalette.white,
      foregroundColor: AspirantsAIPalette.black,
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AspirantsAIPalette.darkBackground,
    textTheme: satoshiTextTheme,
    primaryColor: AspirantsAIPalette.offWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AspirantsAIPalette.darkGrey,
      foregroundColor: AspirantsAIPalette.white,
      elevation: 0,
    ),
  );
}
