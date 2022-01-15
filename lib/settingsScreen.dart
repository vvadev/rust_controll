// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/theme/theme_provider.dart';
import 'package:rust_controll/theme/change_theme_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  void _launchURL() async {
    !await launch('https://discord.gg/TNJWyaSReB');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: [
            Container(
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
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("Settings",
                        style: Theme.of(context).textTheme.headline2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Dark Theme',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const Spacer(),
                        const ChangeThemeButtonWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.greenContainer,
              ),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 275, height: 40),
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        )),
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text(
                      'About Developer',
                      style: Theme.of(context).textTheme.headline2,
                    )),
              ),
            ),
            // Container(
            //   // height: 50,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(20),
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.5),
            //         spreadRadius: 2,
            //         blurRadius: 6,
            //         offset: const Offset(2, 3),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     children: const [
            //       SizedBox(height: 5),
            //       Text(
            //         "About developer",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
