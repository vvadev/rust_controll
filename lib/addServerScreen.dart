// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/mainScreen.dart';

import 'data/class_server.dart';
import 'data/sharedPref.dart';

class AddServerScreen extends StatefulWidget {
  const AddServerScreen({Key? key}) : super(key: key);

  @override
  _AddServerScreenState createState() => _AddServerScreenState();
}

class _AddServerScreenState extends State<AddServerScreen> {
  SharedPref sharedPref = SharedPref();
  Server serverSave = Server();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Add new server",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                sharedPref.saveServer(serverSave);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
                // Navigator.pop(context);
              },
              child: const Icon(Icons.save),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.green; // <-- Splash color
                }),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                              "Server name",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "Your server name",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.serverName = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Panel address",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "https://panel.example.com/",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.panelAddress = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Server ID",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "c5d1a4bc",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.serverID = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "APIKEY",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "your apikey",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.apiKey = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                              "SFTP Host",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "example.com",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.sftpHost = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Port",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "22",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.port = int.parse(text);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Username",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.userName = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Password",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "Your password",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                serverSave.password = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Auto Wipe Files",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: TextField(
                              minLines: 1,
                              maxLines: 20,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                  hintText: "Files from a new line",
                                  hintStyle: TextStyle(color: Colors.white30),
                                  helperText: "Example:\n/oxide/data/file.json",
                                  helperStyle: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              onChanged: (text) {
                                serverSave.autoWipe = text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
