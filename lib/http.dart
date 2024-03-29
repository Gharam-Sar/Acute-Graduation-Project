import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
//const DOMAIN = "192.168.1.11:8000"; //raghad'
//const DOMAIN = "192.168.1.102:8000"; //sarta

const DOMAIN = "172.16.96.75:8000"; //nablus
//const DOMAIN = "172.19.14.154:8000"; // uni

Future<RequestResult> http_get(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);

  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";

  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";

  var dataStr = jsonEncode(data);
  var result = await http.post(Uri.parse(url),
      body: dataStr, headers: {"Content-Type": "application/json"});

  return RequestResult(true, jsonDecode(result.body));
}
