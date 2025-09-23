import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    extensions: <ThemeExtension<dynamic>>[],
  );
}
