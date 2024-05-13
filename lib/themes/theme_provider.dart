import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'light_mode.dart';
import 'dark_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _box.isEmpty ? _box.put("theme", "dark") : _box.delete("theme");
    print(_box.values);
    notifyListeners();
  }

  final _box = Hive.box("box");

  void toggleTheme() {
    if (_themeData == lightMode || _box.isNotEmpty) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
