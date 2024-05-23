import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.black,
  Colors.lightBlue,
  Colors.purple
];

class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
      : assert(selectedColor <= _colorThemes.length - 1,
            "color must be between 0 and ${_colorThemes.length}");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
