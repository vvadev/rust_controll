class Server {
  String serverName = '';
  String panelAddress = '';
  String serverID = '';
  String apiKey = '';
  String autoWipe = '';
  String sftpHost = '';
  int port = 2022;
  String userName = '';
  String password = '';

  Server({
    this.serverName = "",
    this.panelAddress = "",
    this.serverID = "",
    this.apiKey = "",
    this.autoWipe = "",
    this.sftpHost = "",
    this.port = 22,
    this.userName = '',
    this.password = '',
  });

  Server.fromJson(Map<String, dynamic> json) {
    serverName = json["server name"];
    panelAddress = json["panel address"];
    serverID = json["server id"];
    apiKey = json["apikey"];
    autoWipe = json["auto wipe"];
    sftpHost = json["sftp host"];
    port = json["port"];
    userName = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() => {
        'server name': serverName,
        'panel address': panelAddress,
        'server id': serverID,
        'apikey': apiKey,
        'auto wipe': autoWipe,
        "sftp host": sftpHost,
        "port": port,
        "username": userName,
        "password": password,
      };
}
