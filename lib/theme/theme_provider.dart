import 'package:flutter/material.dart';
import 'package:rust_controll/data/saveTheme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

extension CustomThemeColors on ColorScheme {
  Color get blueContainer => brightness == Brightness.dark
      ? Colors.blueAccent.shade400
      : Colors.blueAccent;
  Color get blueContainerShadow => brightness == Brightness.dark
      ? Colors.blue.shade600.withOpacity(0.5)
      : Colors.blue.withOpacity(0.6);

  Color get greenContainer =>
      brightness == Brightness.dark ? Color(0xFF009900) : Colors.green;
  Color get greenContainerShadow => brightness == Brightness.dark
      ? Colors.green.withOpacity(0.5)
      : Colors.greenAccent.withOpacity(0.5);

  Color get orangeContainer =>
      brightness == Brightness.dark ? Color(0xFFFF6600) : Colors.orangeAccent;
  Color get orangeContainerShadow => brightness == Brightness.dark
      ? Colors.orange.shade900.withOpacity(0.5)
      : Colors.orange.withOpacity(0.5);

  Color get containerBackground => brightness == Brightness.dark
      ? Colors.grey.withOpacity(0.4)
      : Colors.grey.withOpacity(0.1);

  Color get mainButtonDefault =>
      brightness == Brightness.dark ? Colors.grey.shade600 : Colors.black54;
  Color get mainButtonSellected =>
      brightness == Brightness.dark ? Colors.white : Colors.blue;
  LinearGradient get cardGradient => brightness == Brightness.dark
      ? LinearGradient(colors: [Colors.blue.shade800, Colors.blue.shade900])
      : const LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent]);
}

class MyThemes {
  static final dartTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: const Color(0xFF121212),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 34, color: Colors.white70, fontWeight: FontWeight.w300),
      headline2: TextStyle(fontSize: 30, color: Colors.white70),
      headline3: TextStyle(fontSize: 20, color: Colors.white70),
      headline4: TextStyle(fontSize: 24, color: Colors.white70),
      headline6: TextStyle(color: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade300,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.blueAccent),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 34, color: Colors.black54, fontWeight: FontWeight.w300),
      headline2: TextStyle(fontSize: 30, color: Colors.white),
      headline3: TextStyle(fontSize: 20, color: Colors.white),
      headline4: TextStyle(fontSize: 24, color: Colors.white),
      headline6: TextStyle(color: Colors.black87),
    ),
  );
}
