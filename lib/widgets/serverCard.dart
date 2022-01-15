// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rust_controll/data/class_server.dart';
import 'package:rust_controll/data/sharedPref.dart';
import 'package:rust_controll/editServerScreen.dart';
import 'package:rust_controll/mainScreen.dart';
import 'package:rust_controll/requests/requestsToPanel.dart';
import 'package:rust_controll/theme/theme_provider.dart';
import 'package:rust_controll/widgets/editStartupScreen.dart';
import 'package:rust_controll/widgets/wipeDialog.dart';

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

  infoText(String title, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Spacer(),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }

  funcButton(String title, Color color, VoidCallback func) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 275, height: 40),
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
              onPressed: func,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              )),
        ));
  }

  getAlertDialog(String title, String content, VoidCallback func) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Text(content),
      contentTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: func,
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  getAlertDialodForWipe(String title, int func) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: wipeDialog(title: title, func: func, server: serverload),
    );
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
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,
              color: Theme.of(context).iconTheme.color),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          serverload.serverName,
          style: Theme.of(context).textTheme.headline6,
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
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.blueContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).colorScheme.blueContainerShadow,
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Info",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          infoText("Server ID", serverload.serverID),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          infoText("Panel", serverload.panelAddress),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          SizedBox(height: 15),
                          Text(
                            "SFTP",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          infoText("SFTP Host", serverload.sftpHost),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          infoText("Port", serverload.port.toString()),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          infoText("Username", serverload.userName),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          serverload.autoWipe != ''
                              ? Row(
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                )
                              : SizedBox(),
                          // const Divider(
                          //   color: Colors.white,
                          //   height: 15,
                          // ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.redAccent,
                      color: Theme.of(context).colorScheme.orangeContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .orangeContainerShadow,
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Functions",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(height: 10),
                          funcButton("Start", Colors.green, () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialog("Warning",
                                      "Are you sure you want to start the server?",
                                      () {
                                    startServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                    Navigator.of(context).pop();
                                  });
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("Restart", Colors.lightBlue, () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialog("Warning",
                                      "Are you sure you want to restart the server?",
                                      () {
                                    restartServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                    Navigator.of(context).pop();
                                  });
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("Stop", Colors.red, () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialog("Warning",
                                      "Are you sure you want to stop the server?",
                                      () {
                                    stopServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                    Navigator.of(context).pop();
                                  });
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("Kill", Colors.grey, () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialog("Warning",
                                      "Are you sure you want to kill the server?",
                                      () {
                                    killServer(serverload.panelAddress,
                                        serverload.serverID, serverload.apiKey);
                                    Navigator.of(context).pop();
                                  });
                                });
                          }),
                          const Divider(
                            color: Colors.white,
                            height: 15,
                          ),
                          Text(
                            "Wipes",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(height: 10),
                          funcButton("Standart", Colors.green, () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialodForWipe("title", 1);
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("Global", Colors.red, () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialodForWipe("title", 2);
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("AutoWipe", Colors.lightBlue, () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialodForWipe("title", 3);
                                });
                          }),
                          const SizedBox(height: 10),
                          funcButton("Delete server.cfg", Colors.grey, () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return getAlertDialog("Warning",
                                      "Are you sure you want to delete server.cfg",
                                      () {
                                    SFTPdeleteFiles(serverload,
                                        "server/rust/cfg/server.cfg");
                                    Navigator.of(context).pop();
                                  });
                                });
                          }),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
