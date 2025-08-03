import 'package:flutter/material.dart';

ThemeData DarkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    surface: Colors.grey.shade900,
    brightness: Brightness.dark,
    primary: Colors.grey.shade600,
    secondary: Color.fromARGB(255, 44, 44, 44),
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
  ),
);
