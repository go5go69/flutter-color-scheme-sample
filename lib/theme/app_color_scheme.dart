import 'package:flutter/material.dart';

class AppColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.orange,
    onPrimary: Colors.white,
    secondary: Colors.green,
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    // OutlineButtonのborderColor,
    outline: Colors.orange,
    // Divider, tabBarのdividerColor
    outlineVariant: Colors.blue,
  );
}
