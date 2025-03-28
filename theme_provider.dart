import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData get currentTheme => _isDarkMode
      ? ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, // Dark theme AppBar color
          ),
          scaffoldBackgroundColor: Colors.black, // Dark theme background color
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
        )
      : ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFD0F0C0), // Light theme AppBar color
          ),
          scaffoldBackgroundColor: const Color(0xFFD0F0C0), // Light theme background color
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
            bodySmall: TextStyle(color: Colors.black),
          ),
        );
}
