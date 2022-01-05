// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server.dart';
import 'package:rust_controll/data/sharedPref.dart';
import 'package:rust_controll/mainScreen.dart';

class editServerScreen extends StatefulWidget {
  const editServerScreen({
    Key? key,
    required this.server,
  }) : super(key: key);

  final Server server;

  @override
  _editServerScreenState createState() => _editServerScreenState(server);
}

class _editServerScreenState extends State<editServerScreen> {
  final Server server;
  SharedPref sharedPref = SharedPref();
  _editServerScreenState(this.server);

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
          "Edit server",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                sharedPref.saveServer(server);
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
                    offset: const Offset(0, 3),
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
                            child: TextFormField(
                              initialValue: server.serverName,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "Your server name",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.serverName = text;
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
                            child: TextFormField(
                              initialValue: server.panelAddress,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "https://panel.example.com/",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.panelAddress = text;
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
                            child: TextFormField(
                              initialValue: server.serverID,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "c5d1a4bc",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.serverID = text;
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
                            child: TextFormField(
                              initialValue: server.apiKey,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "your apikey",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.apiKey = text;
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
                    offset: const Offset(0, 3),
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
                            child: TextFormField(
                              initialValue: server.sftpHost,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "example.com",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.sftpHost = text;
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
                            child: TextFormField(
                              initialValue: server.port.toString(),
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "22",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.port = int.parse(text);
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
                            child: TextFormField(
                              initialValue: server.userName,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.userName = text;
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
                            child: TextFormField(
                              initialValue: server.password,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: const InputDecoration(
                                hintText: "Your password",
                                hintStyle: TextStyle(color: Colors.white30),
                              ),
                              onChanged: (text) {
                                server.password = text;
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
                    offset: const Offset(0, 3),
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
                            child: TextFormField(
                              initialValue: server.autoWipe,
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
                                server.autoWipe = text;
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
