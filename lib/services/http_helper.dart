import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> httpHelper(String uri) async {
  http.Response response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    debugPrint(response.statusCode.toString());
    throw Exception("An error has occurred while parsing url");
  }
}