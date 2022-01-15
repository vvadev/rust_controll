import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rust_controll/data/saveTheme.dart';
import 'package:rust_controll/theme/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: Colors.black,
      activeTrackColor: Colors.white,
      inactiveTrackColor: Colors.black,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        saveThemeMode(value);
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
