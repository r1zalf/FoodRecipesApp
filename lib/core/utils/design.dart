import 'package:flutter/material.dart';

class Design {
  static const double margin = 20;
  static const double contentMargin = 10;

  static const Color primaryColor = Color.fromARGB(255, 21, 131, 104);
  static const Color accentColor = Color.fromARGB(255, 233, 247, 237);
  static const Color errorColor = Color(0xFFED2E7E);
  static const Color successColor = Color(0xFF00BA88);
  static const Color warningColor = Color(0xFFF4B740);

  static const Color backgroundColor = Color(0xFFF7F7FC);

  static final accentButton = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(width: 1, color: Design.primaryColor),
    borderRadius: BorderRadius.circular(8),
  );

  static final ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    accentColor: accentColor,
    backgroundColor: backgroundColor,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(width: 0, color: primaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(width: 0, color: errorColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(width: 0, color: errorColor),
      ),
      contentPadding: EdgeInsets.all(4),
      labelStyle: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFCECECE), size: 28),
    primaryIconTheme: const IconThemeData(color: accentColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
     textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 12, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, color: Colors.black),
      subtitle1: TextStyle(fontSize: 16, color: Colors.black),
      subtitle2: TextStyle(fontSize: 18, color: Colors.black),
      headline1: TextStyle(fontSize: 20, color: Colors.black),
      headline2: TextStyle(fontSize: 22, color: Colors.black),
      headline3: TextStyle(fontSize: 24, color: Colors.black),
      headline4: TextStyle(fontSize: 26, color: Colors.black),
      headline5: TextStyle(fontSize: 28, color: Colors.black),
      headline6: TextStyle(fontSize: 30, color: Colors.black),
    ),
  );
}
