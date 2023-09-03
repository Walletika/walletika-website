import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchString(String apiURL) async {
  final http.Response response = await http.get(Uri.parse(apiURL));
  return response.body;
}

Future<List<Map<String, dynamic>>> fetchList(String apiURL) async {
  return jsonDecode(await fetchString(apiURL)).cast<Map<String, dynamic>>();
}

Future<Map<String, dynamic>> fetchMap(String apiURL) async {
  return jsonDecode(await fetchString(apiURL)).cast<String, dynamic>();
}
