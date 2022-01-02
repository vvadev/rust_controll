// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'class_server_info.dart';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "");
  }

  readServer(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonSev = json.decode(prefs.getString("servers") ?? "");
    print(jsonSev);
    return jsonSev['list']['$key'];
  }

  readAllServers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonSev = json.decode(prefs.getString("servers") ?? "");
    print(jsonSev);
    return jsonSev['list'];
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  saveServer(Server value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      late Map jsonSev;
      jsonSev = await read("servers");
      jsonSev['list'][value.serverID] = value;
      jsonSev['count'] = jsonSev['list'].length;

      prefs.setString("servers", json.encode(jsonSev));
      print("saved");
    } catch (Excepetion) {
      print(Excepetion);

      Map jsonSev = {
        'list': {},
        'count': 0,
      };
      save("servers", jsonSev);
      saveServer(value);
    }
  }

  removeServer(String key) async {
    print("startRemoving");
    final prefs = await SharedPreferences.getInstance();

    Map jsonSev = await json.decode(prefs.getString("servers") ?? "");
    jsonSev["list"].remove(key);

    print(jsonSev);
    late Map newJsonSev = {};
    // newJsonSev['list'] = jsonSev['list'].remove(key);
    newJsonSev['list'] = jsonSev["list"];
    newJsonSev['count'] = jsonSev["list"].length;
    prefs.setString("servers", json.encode(newJsonSev));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
