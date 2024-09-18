import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue[300],
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87), // 标题
      titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black54), // 副标题
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87), // 正文
    ),
    cardTheme: CardTheme(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue[400],
      unselectedItemColor: Colors.grey,
      selectedLabelStyle:
          TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w600),
    ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(Colors.white70),
        ),
      )
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.blueGrey[800],
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    cardTheme: CardTheme(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blue[400],
        unselectedItemColor: Colors.black,
      selectedLabelStyle:
          TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w600),
    ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(Colors.white),
        ),
      )
  );
}
