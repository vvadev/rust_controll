// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/theme/theme_provider.dart';
import 'package:rust_controll/theme/change_theme_button_widget.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                color: Theme.of(context).colorScheme.blueContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.blueContainerShadow,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text("Settings",
                      style: Theme.of(context).textTheme.headline2),
                  const ChangeThemeButtonWidget(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  SizedBox(height: 5),
                  Text(
                    "About developer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
