import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static const String url = "192.168.0.105";

  static Future<List> getCategory() async {
    http.Response response;

    Uri uri = Uri.http(url, "/api/getCategory");
    response = await http.get(uri);

    if (response.statusCode == 404) {
      return [];
    }
    var json = jsonDecode(response.body);

    return json;
  }

  static Future<List> getItemPopular() async {
    http.Response response;

    Uri uri = Uri.http(url, "/api/getItemPopular");
    response = await http.get(uri);

    if (response.statusCode == 404) {
      return [];
    }
    var json = jsonDecode(response.body);

    return json;
  }

  static Future<List> getItemforCategory(String num) async {
    http.Response response;

    Uri uri = Uri.http(url, "/api/getItemforCategory/$num");
    response = await http.get(uri);

    if (response.statusCode == 404) {
      return [];
    }
    var json = jsonDecode(response.body);

    return json;
  }
}
