import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const BACKGROUND_COLOR = Color(0xff13131a);

abstract class ThemeUtils {
  static ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      backgroundColor: BACKGROUND_COLOR,
      scaffoldBackgroundColor: BACKGROUND_COLOR,
      canvasColor: BACKGROUND_COLOR,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme,
      ),
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
