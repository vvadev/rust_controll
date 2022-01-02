class Server {
  String serverName = '';
  String panelAddress = '';
  String serverID = '';
  String apiKey = '';

  Server({
    this.serverName = "",
    this.panelAddress = "",
    this.serverID = "",
    this.apiKey = "",
  });

  Server.fromJson(Map<String, dynamic> json) {
    serverName = json["server name"];
    panelAddress = json["panel address"];
    serverID = json["server id"];
    apiKey = json["apikey"];
  }

  Map<String, dynamic> toJson() => {
        'server name': serverName,
        'panel address': panelAddress,
        'server id': serverID,
        'apikey': apiKey,
      };
}
