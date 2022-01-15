// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/mainScreen.dart';
import 'package:rust_controll/theme/theme_provider.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add new server",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: IconButton(
              icon: Icon(
                Icons.save,
                color: Theme.of(context).iconTheme.color,
              ),
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
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.containerBackground,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Server name",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Panel address",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Server ID",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "APIKEY",
                              style: Theme.of(context).textTheme.headline3,
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
                color: Theme.of(context).colorScheme.greenContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.greenContainerShadow,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "SFTP Host",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Port",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Username",
                              style: Theme.of(context).textTheme.headline3,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Password",
                              style: Theme.of(context).textTheme.headline3,
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
                color: Theme.of(context).colorScheme.orangeContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.orangeContainerShadow,
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
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Auto Wipe Files",
                              style: Theme.of(context).textTheme.headline3,
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
