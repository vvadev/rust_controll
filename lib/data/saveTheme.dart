// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

loadThemeMode() async {
  final _prefs = await SharedPreferences.getInstance();
  String? status = _prefs.getString("THEME_PREF");
  if (status == null) {
    if (ThemeMode.system == ThemeMode.dark) {
      await saveThemeMode(false);
      return loadThemeMode();
    } else {
      await saveThemeMode(true);
      return loadThemeMode();
    }
  } else {
    if (status == 'true') {
      return true;
    } else {
      return false;
    }
  }
  // await _prefs.remove('THEME_PREF');
}

saveThemeMode(bool value) async {
  final _prefs = await SharedPreferences.getInstance();
  return _prefs.setString("THEME_PREF", value.toString());
}
