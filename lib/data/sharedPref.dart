// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'class_server.dart';

class SharedPref {
  // чтение переменной из пямяти по ключу
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "");
  }

  // чтение определенного сервера по его id
  readServer(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonSev = json.decode(prefs.getString("servers") ?? "");
    print(jsonSev);
    return jsonSev['list']['$key'];
  }

  // чтение всего списка серверов
  readAllServers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonSev = json.decode(prefs.getString("servers") ?? "");
    print(jsonSev);
    return jsonSev['list'];
  }

  // сохранение переменной value с ключом key
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  // сохранение сервера с ключом в виде его id
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

      // создаем пустой список серверов в случае, если он отсутствует
      Map jsonSev = {
        'list': {},
        'count': 0,
      };

      // сохраняем пустой список серверов и перезапускаем функцию сохранениея сервера
      save("servers", jsonSev);
      saveServer(value);
    }
  }

  // удаление сервера по его id
  removeServer(String key) async {
    print("startRemoving");
    final prefs = await SharedPreferences.getInstance();

    // получаем список всех серверов и удаляем из него сервер с переданным id
    Map jsonSev = await json.decode(prefs.getString("servers") ?? "");
    jsonSev["list"].remove(key);

    // print(jsonSev);
    late Map newJsonSev = {};
    newJsonSev['list'] = jsonSev["list"];
    newJsonSev['count'] = jsonSev["list"].length;
    prefs.setString("servers", json.encode(newJsonSev));
  }

  // удаление переменной с ключом key
  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
