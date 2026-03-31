import 'Package:flutter/material.dart';

class MPTheme {

  static final theme = ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    fontFamily: "Lora",
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: scheme.onPrimary,
    )
  );

  static final scheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color.fromARGB(255, 231, 130, 15),
    onPrimary: const Color.fromARGB(255, 205, 205, 205),
    secondary: const Color.fromARGB(255, 37, 37, 37),
    onSecondary: const Color.fromARGB(255, 239, 239, 239),
    error: const Color.fromARGB(255, 4, 0, 255),
    onError: const Color.fromARGB(255, 255, 255, 255),
    surface: const Color.fromARGB(255, 201, 201, 201),
    onSurface: const Color.fromARGB(255, 66, 66, 66)
  );
}