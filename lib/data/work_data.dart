import 'package:flutter/material.dart';
import 'package:rust_controll/requests/requestsToPanel.dart';
import 'sharedPref.dart';
import 'class_server.dart';

/*

  Demo экран для тестирования работы с сохраненным файлом

  приложение не имеет важных зависимойтей от этого файла и он может быть удален при необходимости

*/

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  SharedPref sharedPref = SharedPref();
  Server serverSave = Server();
  Server serverload = Server();
  String getId = '';

  loadSharedPrefs(String id) async {
    try {
      Server server = Server.fromJson(await sharedPref.readServer(id));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: new Text("Loaded!"),
          duration: const Duration(milliseconds: 500)));
      setState(() {
        serverload = server;
      });
    } catch (Excepetion) {
      print(Excepetion);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (value) {
                        setState(() {
                          serverSave.serverName = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "panel"),
                      onChanged: (value) {
                        setState(() {
                          serverSave.panelAddress = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "id"),
                      onChanged: (value) {
                        setState(() {
                          serverSave.serverID = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "apikey"),
                      onChanged: (value) {
                        setState(() {
                          serverSave.apiKey = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "getid"),
                      onChanged: (value) {
                        setState(() {
                          getId = value;
                        });
                      },
                    )),
              ],
            ),
          ),
          Container(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    sharedPref.saveServer(serverSave);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: new Text("Saved!"),
                        duration: const Duration(milliseconds: 500)));
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    globalWipe(serverload);
                  },
                  child: Text('Load', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    sharedPref.remove("servers");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: new Text("Cleared!"),
                        duration: const Duration(milliseconds: 500)));
                    setState(() {
                      serverSave = Server();
                    });
                  },
                  child: Text('Clear', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Name: " + (serverload.serverName),
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
