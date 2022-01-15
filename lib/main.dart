import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rust_controll/addServerScreen.dart';
import 'package:rust_controll/data/work_data.dart';
import 'package:rust_controll/mainScreen.dart';
import 'package:rust_controll/settingsScreen.dart';
import 'package:rust_controll/theme/theme_provider.dart';
import 'package:rust_controll/widgets/serverCard.dart';

import 'widgets/listServers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rust Server Controller',
          // theme: ThemeData(primarySwatch: Colors.blue),
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.dartTheme,
          // home: settingsScreen(),
          // home: Demo(),
          // home: AddServerScreen(),
          // home: ServerCard(serverIndex: "1"),
          home: MainScreen(),
        );
      },
    );
  }
}
