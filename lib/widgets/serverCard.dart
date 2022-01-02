// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server_info.dart';
import 'package:rust_controll/data/sharedPref.dart';
import 'package:rust_controll/mainScreen.dart';
import 'package:rust_controll/requests/requestsToPanel.dart';

class ServerCard extends StatefulWidget {
  const ServerCard({
    Key? key,
    required this.serverIndex,
  }) : super(key: key);
  final String serverIndex;

  @override
  _ServerCardState createState() => _ServerCardState(serverIndex);
}

class _ServerCardState extends State<ServerCard> {
  SharedPref sharedPref = SharedPref();
  Server serverload = Server();

  // получаем данные сервера из памяти
  loadSharedPrefs(String id) async {
    try {
      Server server = Server.fromJson(await sharedPref.readServer(id));
      setState(() {
        serverload = server;
      });
    } catch (Excepetion) {}
  }

  final String serverIndex;

  _ServerCardState(this.serverIndex);

  @override
  initState() {
    super.initState();
    loadSharedPrefs(serverIndex);
  }

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
        title: Text(
          serverload.serverName,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              sharedPref.removeServer(serverIndex);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                    height: 300,
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Server ID",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                serverload.serverID,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Panel",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                serverload.panelAddress,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    height: 300,
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              startServer(serverload.panelAddress,
                                  serverload.serverID, serverload.apiKey);
                            },
                            child: Text(
                              "Start",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
