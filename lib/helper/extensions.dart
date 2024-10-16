import 'package:flutter/material.dart';

extension ColorExtension on Color {
  MaterialColor toMaterialColor() {
    return MaterialColor(
      value,
      <int, Color>{
        50: _shadeColor(this, 0.1),
        100: _shadeColor(this, 0.2),
        200: _shadeColor(this, 0.3),
        300: _shadeColor(this, 0.4),
        400: _shadeColor(this, 0.5),
        500: this,
        600: _shadeColor(this, 0.7),
        700: _shadeColor(this, 0.8),
        800: _shadeColor(this, 0.9),
        900: _shadeColor(this, 1),
      },
    );
  }

  // This function lightens the color based on the shade percentage
  Color _shadeColor(Color color, double strength) {
    final double ds = 0.5 - strength;
    return Color.fromRGBO(
      color.red + ((ds < 0 ? color.red : (255 - color.red)) * ds).round(),
      color.green + ((ds < 0 ? color.green : (255 - color.green)) * ds).round(),
      color.blue + ((ds < 0 ? color.blue : (255 - color.blue)) * ds).round(),
      1,
    );
  }
}
