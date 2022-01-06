// ignore_for_file: file_names, unnecessary_new

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rust_controll/data/class_server.dart';
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

SFTPdeleteFiles(Server server, String path) async {
  var client2 = new SSHClient(
    host: server.sftpHost,
    port: server.port,
    username: server.userName,
    passwordOrKey: server.password,
  );
  try {
    String? result = '';
    result = await client2.connect();
    if (result == "session_connected") {
      result = await client2.connectSFTP() ?? 'Null result';
      if (result == "sftp_connected") {
        print(await client2.sftpRm(path));
      }
    }
  } on PlatformException catch (e) {
    String errorMessage = 'Error: ${e.code}\nError Message: ${e.message}';
    String result = errorMessage;
    print(errorMessage);
  }
}

SFTPGetFiles(Server server, String path) async {
  var client2 = new SSHClient(
    host: server.sftpHost,
    port: server.port,
    username: server.userName,
    passwordOrKey: server.password,
  );
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

SFTPDownloadFile(Server server, String path, String fileName) async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  print(tempPath);
  var client2 = new SSHClient(
    host: server.sftpHost,
    port: server.port,
    username: server.userName,
    passwordOrKey: server.password,
  );
  try {
    String? result = '';
    result = await client2.connect();
    if (result == "session_connected") {
      result = await client2.connectSFTP() ?? 'Null result';
      if (result == "sftp_connected") {
        await client2.sftpDownload(
          path: '$path/$fileName',
          toPath: tempPath,
        );
        return '$tempPath/$fileName';
      }
    }
  } catch (e) {
    print('error download');
  }
  // await client2.sftpDownload(
  //     path: path,
  //     toPath: tempPath,
  //     callback: (progress) async {
  //       print(progress);
  //     });
}

// функция получения файла настроек с сервера. Возвращает Map
getServerCFG(Server server) async {
  var path = await SFTPDownloadFile(server, "", "serverauto.cfg");
  if (path != '') {
    final File file = File(path);

    String text = await file.readAsString();
    List settingsTemp = text.split('\n');
    Map settings = {};
    for (int i = 1; i < settingsTemp.length; i++) {
      if (!settingsTemp[i].isEmpty) {
        List splited = settingsTemp[i].split(' ');
        settings[splited[0]] = splited[1];
      }
    }
    await file.delete();

    await setServerCFG(server, settings);
    return settings;
  } else {
    print("error serverCFG");
  }
}

setServerCFG(Server server, Map settings) async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final File file = File('$tempPath/serverauto.cfg');
  for (var i in settings.entries) {
    await file.writeAsString('\n${i.key} ${i.value}', mode: FileMode.append);
  }

  var client2 = new SSHClient(
    host: server.sftpHost,
    port: server.port,
    username: server.userName,
    passwordOrKey: server.password,
  );
  try {
    String? result = '';
    result = await client2.connect();
    if (result == "session_connected") {
      result = await client2.connectSFTP() ?? 'Null result';
      if (result == "sftp_connected") {
        await client2.sftpUpload(
          path: file.path,
          toPath: "",
        );
      }
    }
  } catch (e) {
    print('error download');
  }

  file.delete();
  // await file.writeAsString(contents);
}

autoWipe(Server server) async {
  List files = server.autoWipe.split('\n');
  for (var file in files) {
    // print(file);
    await SFTPdeleteFiles(server, file);
  }
}

globalWipe(Server server) async {
  await stopServer(server.panelAddress, server.serverID, server.apiKey);
  sleep(const Duration(seconds: 10));

  // Удаление всех файлов из папки rust
  List files = await SFTPGetFiles(server, "/server/rust");

  for (var file in files) {
    String fileExtension = file["filename"];
    // print(fileExtension);
    if (fileExtension.length > 4) {
      if ((fileExtension.substring(fileExtension.length - 4) == ".sav") ||
          (fileExtension.substring(fileExtension.length - 3) == ".db")) {
        await SFTPdeleteFiles(server, "/server/rust/" + fileExtension);
      }
    }
  }

  // автовайп
  await autoWipe(server);
  sleep(const Duration(seconds: 10));
  //startServer(server.panelAddress, server.serverID, server.apiKey);
}
