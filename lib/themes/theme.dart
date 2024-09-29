import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 0, 128, 255), // 亮蓝色，具有科技感
    scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 30, 30, 30),
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 80, 80, 80),
      ),
      bodyMedium:
          TextStyle(fontSize: 16, color: Color.fromARGB(255, 30, 30, 30)),
    ),
    cardTheme: CardTheme(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
            color: Color.fromARGB(255, 0, 128, 255), width: 2), // 卡片边框为蓝色
      ),
      color: const Color.fromARGB(255, 250, 250, 250),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      selectedItemColor: Color.fromARGB(255, 0, 128, 255),
      unselectedItemColor: Color.fromARGB(255, 180, 180, 180),
      selectedLabelStyle: TextStyle(
        color: Color.fromARGB(255, 0, 128, 255),
        fontWeight: FontWeight.w600,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all(24.0),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(255, 0, 128, 255).withOpacity(0.2);
          }
          return null;
        }),
        iconColor: WidgetStateProperty.all(Colors.black54),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 128, 0, 255), // 深紫色，科幻感
    scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Colors.white54,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    cardTheme: CardTheme(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
            color: Color.fromARGB(255, 128, 0, 255), width: 2), // 卡片边框为深紫色
      ),
      color: const Color.fromARGB(255, 50, 50, 50),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      selectedItemColor: Color.fromARGB(255, 128, 0, 255),
      unselectedItemColor: Color.fromARGB(255, 100, 100, 100),
      selectedLabelStyle: TextStyle(
        color: Color.fromARGB(255, 128, 0, 255),
        fontWeight: FontWeight.w600,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all(24.0),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(255, 128, 0, 255).withOpacity(0.2);
          }
          return null;
        }),
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
  );
}
