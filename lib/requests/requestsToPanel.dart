// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

startServer(String panelURL, String serverID, String key) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + key,
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

stopServer(String panelURL, String serverID, String key) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + key,
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

restartServer(String panelURL, String serverID, String key) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + key,
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

killServer(String panelURL, String serverID, String key) async {
  String url = panelURL + 'api/client/servers/' + serverID + '/power';
  try {
    var response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer " + key,
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
