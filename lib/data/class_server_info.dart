class Server {
  String serverName = '';
  String panelAddress = '';
  String serverID = '';
  String apiKey = '';
  String autoWipe = '';

  Server({
    this.serverName = "",
    this.panelAddress = "",
    this.serverID = "",
    this.apiKey = "",
    this.autoWipe = "",
  });

  Server.fromJson(Map<String, dynamic> json) {
    serverName = json["server name"];
    panelAddress = json["panel address"];
    serverID = json["server id"];
    apiKey = json["apikey"];
    autoWipe = json["auto wipe"];
  }

  Map<String, dynamic> toJson() => {
        'server name': serverName,
        'panel address': panelAddress,
        'server id': serverID,
        'apikey': apiKey,
        'auto wipe': autoWipe,
      };
}
