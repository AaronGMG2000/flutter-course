import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.amber.shade600;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: AppBarTheme(color: primary, elevation: 0),
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary, elevation: 5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: AppBarTheme(color: primary, elevation: 0),
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primary, elevation: 5),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
  );
}
