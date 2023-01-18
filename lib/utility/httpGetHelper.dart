import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const webServerRootPath = 'fuchsia-outstanding-plow.glitch.me';

// 1. GET /
Future<http.Response> getRootWebSite() async {
  var url = Uri.https(webServerRootPath, '/');
  //var url = Uri.https('www.example.com', '/');

  var response = await http.get(url);
  debugPrint('Root page response status: ${response.statusCode}');
  //debugPrint('Response body: ${response.body}');

  return response;
}

// 13. GET /utenti
Future<http.Response> getUsers() async {
  var url = Uri.https(webServerRootPath, '/utenti');

  // negozio la codifica JSON
  //var response = await http.get(url, headers: {'Accept': 'application/json'});
  var response = await http.get(url);
  debugPrint('Get utenti response status: ${response.statusCode}');
  debugPrint(response.body);

  return response;
}
