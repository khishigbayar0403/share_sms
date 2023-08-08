import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = ThemeMode.system == ThemeMode.dark;
  bool get isDark => _isDark;
  // Map<String, Color> get themeColors => _isDark ? darkColors : lightColors;

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
