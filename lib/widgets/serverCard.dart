// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server.dart';
import 'package:rust_controll/data/sharedPref.dart';
import 'package:rust_controll/editServerScreen.dart';
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editServerScreen(server: serverload),
                ),
              );
            },
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
                          const Text(
                            "Info",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
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
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Auto Wipe Files:",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    serverload.autoWipe,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
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
                          const Text(
                            "Functions",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 112)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    startServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                  },
                                  child: const Text(
                                    "Start",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.lightBlue,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 100)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    restartServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                  },
                                  child: const Text(
                                    "Restart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.orange,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 115)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    restartServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                  },
                                  child: const Text(
                                    "Stop",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 122)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    killServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                  },
                                  child: const Text(
                                    "Kill",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          const Text(
                            "Wipes",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.lightGreen,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 92)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    getServerCFG(serverload);
                                  },
                                  child: const Text(
                                    "Standart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.orangeAccent,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 104)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    globalWipe(serverload);
                                  },
                                  child: const Text(
                                    "Global",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                          const SizedBox(height: 10),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.lightBlue,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      alignment: Alignment.center,
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 86)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                  onPressed: () {
                                    autoWipe(serverload);
                                  },
                                  child: const Text(
                                    "AutoWipe",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ))),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
