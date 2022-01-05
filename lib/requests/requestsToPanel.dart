// ignore_for_file: file_names

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rust_controll/data/class_server_info.dart';
import 'dart:convert';
import 'package:ssh2/ssh2.dart';

/*

  Функции в данном файле позволяют отправлять запросы к панели управления
  по средствам передачи url, id, apikey
  URL для отправки формируется из адреса панели и id сервера

  headers  содержит имформацию для авторищации
  body отправляемые данные

*/

startServer(String panelURL, String serverID, String apikey) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Accept": "application/json",
          "Content-Type": "application/json",
          "cookie":
              "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
        },
        body: jsonEncode({
          "signal": "start",
        }));
    print(response.body);
  } catch (error) {
    print(error);
  }
}

stopServer(String panelURL, String serverID, String apikey) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Accept": "application/json",
          "Content-Type": "application/json",
          "cookie":
              "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
        },
        body: jsonEncode({
          "signal": "stop",
        }));
    print(response.body);
  } catch (error) {
    print(error);
  }
}

restartServer(String panelURL, String serverID, String apikey) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Accept": "application/json",
          "Content-Type": "application/json",
          "cookie":
              "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
        },
        body: jsonEncode({
          "signal": "restart",
        }));
    print(response.body);
  } catch (error) {
    print(error);
  }
}

killServer(String panelURL, String serverID, String apikey) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Accept": "application/json",
          "Content-Type": "application/json",
          "cookie":
              "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
        },
        body: jsonEncode({
          "signal": "kill",
        }));
    print(response.body);
  } catch (error) {
    print(error);
  }
}

getFiles(String panelURL, String serverID, String apikey, String path) async {
  try {
    String url = panelURL + 'api/client/servers/' + serverID + path;
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer " + apikey,
        "Accept": "application/json",
        "Content-Type": "application/json",
        "cookie":
            "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
      },
    );
    print(response.body);
    return response.body;
  } catch (error) {
    print(error);
  }
}

deleteFiles(String panelURL, String serverID, String apikey, String path,
    List files) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/files/delete';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + apikey,
          "Accept": "application/json",
          "Content-Type": "application/json",
          "cookie":
              "pterodactyl_session=eyJpdiI6InhIVXp5ZE43WlMxUU1NQ1pyNWRFa1E9PSIsInZhbHVlIjoiQTNpcE9JV3FlcmZ6Ym9vS0dBTmxXMGtST2xyTFJvVEM5NWVWbVFJSnV6S1dwcTVGWHBhZzdjMHpkN0RNdDVkQiIsIm1hYyI6IjAxYTI5NDY1OWMzNDJlZWU2OTc3ZDYxYzIyMzlhZTFiYWY1ZjgwMjAwZjY3MDU4ZDYwMzhjOTRmYjMzNDliN2YifQ%253D%253D"
        },
        body: jsonEncode({
          "root": path,
          "files": files,
        }));
    print(response.body);
  } catch (error) {
    print(error);
  }
}

SFTPdeleteFiles(String path, String fileName) async {
  var client2 = new SSHClient(
      host: "eu-node-2.alkad.org",
      port: 2022,
      username: 'starley.6238dd2d',
      passwordOrKey: "Vovanchik430/");
  try {
    String? result = '';
    result = await client2.connect();
    if (result == "session_connected") {
      result = await client2.connectSFTP() ?? 'Null result';
      if (result == "sftp_connected") {
        print(await client2.sftpRm(path + fileName));
      }
    }
  } on PlatformException catch (e) {
    String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
    String result = errorMessage;
    print(errorMessage);
  }
}

SFTPGetFiles(String path) async {
  var client2 = new SSHClient(
      host: "eu-node-2.alkad.org",
      port: 2022,
      username: 'starley.6238dd2d',
      passwordOrKey: "Vovanchik430/");
  try {
    String? result = '';
    result = await client2.connect();
    if (result == "session_connected") {
      result = await client2.connectSFTP() ?? 'Null result';
      if (result == "sftp_connected") {
        return await client2.sftpLs(path);
      }
    }
  } on PlatformException catch (e) {
    String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
    String result = errorMessage;
    print(errorMessage);
  }
}

Future<void> globalWipe(Server server) async {
  print('start Global Wipe');
  await stopServer(server.panelAddress, server.serverID, server.apiKey);
  print("stopping complite");
  sleep(const Duration(seconds: 10));

  // Удаление всех файлов из папки rust
  List files = await SFTPGetFiles("/server/rust");

  for (var file in files) {
    String fileExtension = file["filename"];
    print(fileExtension);
    if (fileExtension.length > 4) {
      if ((fileExtension.substring(fileExtension.length - 4) == ".sav") ||
          (fileExtension.substring(fileExtension.length - 3) == ".db")) {
        await SFTPdeleteFiles("/server/rust/", fileExtension);
      }
    }
  }
  print('Выполнено удаление файлов из папки rust');
  sleep(const Duration(seconds: 10));
  //startServer(server.panelAddress, server.serverID, server.apiKey);
}
