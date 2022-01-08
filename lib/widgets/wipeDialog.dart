// ignore_for_file: file_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server.dart';
import 'package:rust_controll/requests/requestsToPanel.dart';

class wipeDialog extends StatefulWidget {
  const wipeDialog({
    Key? key,
    required this.title,
    required this.func,
    required this.server,
  }) : super(key: key);

  final Server server;
  final String title;
  final int func;

  @override
  _wipeDialogState createState() => _wipeDialogState(title, func, server);
}

class _wipeDialogState extends State<wipeDialog> {
  _wipeDialogState(this.title, this.func, this.server);

  final String title;
  final int func;
  final Server server;

  int worldType = 1;
  String worldSeed = '';
  String worldSize = '';
  String worldURL = '';
  bool isLoad = false;
  String loadText = '';

  doWipe() async {
    await setServerCFG(server, worldType, worldSeed, worldSize, worldURL, func);
    setState(() {
      loadText = 'Done';
    });
    Timer _timer = Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoad
            ? Container(
                height: 500,
                child: Center(
                  child: loadText == ''
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          loadText,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                ),
              )
            : Container(
                height: 500,
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          "Enter parameters",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 310,
                        child: ListView(
                          children: [
                            Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, left: 20),
                                    child: Text(
                                      "World Type",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      child: DropdownButtonFormField<int>(
                                        dropdownColor: Colors.black45,
                                        value: worldType,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                        onChanged: (value) {
                                          setState(() {
                                            worldType = value!;
                                          });
                                        },
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text("Procedurel"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Barren"),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("qwe"),
                                            value: 3,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, left: 20),
                                    child: Text(
                                      "World Size",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: const InputDecoration(
                                        hintText: "4000",
                                        hintStyle:
                                            TextStyle(color: Colors.white30),
                                      ),
                                      onChanged: (text) {
                                        worldSize = text;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, left: 20),
                                    child: Text(
                                      "World Seed",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: const InputDecoration(
                                        hintText: "123456",
                                        hintStyle:
                                            TextStyle(color: Colors.white30),
                                      ),
                                      onChanged: (text) {
                                        worldSeed = text;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15, left: 20),
                                    child: Text(
                                      "World URL",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: TextField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: const InputDecoration(
                                        hintText: "https://example.com",
                                        hintStyle:
                                            TextStyle(color: Colors.white30),
                                      ),
                                      onChanged: (text) {
                                        worldURL = text;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              setState(() {
                                isLoad = true;
                              });
                              doWipe();
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
