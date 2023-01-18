import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //HTTP request API
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const webServerRootPath = 'fuchsia-outstanding-plow.glitch.me';

// dati dell'utente
// come struct di C
class UserData {
  // attributi dell'utente
  String username;
  String password;
  List<String>? listaLibri;
  bool? jwtScaduto;
  String? jwtCookieSession;

  // costruttore dell'utente
  UserData({
    required this.username,
    required this.password,
    this.listaLibri,
    this.jwtScaduto,
    this.jwtCookieSession,
  });
}

// notificatore di UserData
// con metodi dell'API HTTP
class User extends StateNotifier<UserData> {
  User(super.state);

  // getter
  String getName() {
    return super.state.username;
  }

  // metodi per richieste dell'utente al server tramite API HTTP

  // 2. PUT /utenti/register/mario/passwordDiMario
  Future<http.Response> registerUser() async {
    String path = '/utenti/register/${state.username}/${state.password}';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    var response = await http.put(url);
    debugPrint(
        'PUT /utenti/register/${state.username}/${state.password} response status: ${response.statusCode}');

    return response;
  }

  // 3. GET /utenti/mario
  Future<http.Response> getBiblio() async {
    var url = Uri.https(webServerRootPath, '/utenti/${state.username}');

    var response = await http.get(url);
    debugPrint(
        'GET /utenti/${state.username} response status: ${response.statusCode}');
    debugPrint(response.body);

    return response;
  }

  // sessione tramite JWT
  // 4. POST /utenti/login/jwt
  // con header Authorization: Basic mario:passwordDiMario
  Future<http.Response> loginJWT() async {
    String path = '/utenti/login/jwt';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    // NB le credenziali sono codificate in Base64 da UTF-8
    String credentials = '${state.username}:${state.password}';
    String encoded = base64.encode(utf8.encode(credentials));

    http.Response response =
        await http.post(url, headers: {'Authorization': 'Basic $encoded'});
    debugPrint('${state.username} login status: ${response.statusCode}');

    var sessionCookie = response.headers['set-cookie'];
    debugPrint('${state.username} Cookie Session JWT: $sessionCookie');

    state.jwtCookieSession = sessionCookie;
    state.jwtScaduto = false;

    // per verificare lo statusCode
    return response;
  }

  // 5. GET /utenti/mario/secret/jwt
  // passando il cookie session JWT ottenuto precedentemente
  Future<http.Response> getSecret() async {
    var url =
        Uri.https(webServerRootPath, '/utenti/${state.username}/secret/jwt');

    var response =
        await http.get(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    debugPrint(
        'GET /utenti/${state.username}/secret/jwt response status: ${response.statusCode}');
    debugPrint(response.body);

    return response;
  }

  // 6. PUT /utenti/mario/libri/add/1984
  Future<http.Response> addBook(String bookTitle) async {
    String path = '/utenti/${state.username}/libri/add/$bookTitle';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.put(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    //debugPrint('Added book: $bookTitle at user: ${state.username}');
    debugPrint(
        'PUT /utenti/${state.username}/libri/add/$bookTitle response status: ${response.statusCode}');

    return response;
  }

  // 7. 9. 11. GET /utenti/mario/libri
  Future<http.Response> getLibri() async {
    var url = Uri.https(webServerRootPath, '/utenti/${state.username}/libri');

    var response =
        await http.get(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    debugPrint(
        'GET /utenti/${state.username}/libri response status: ${response.statusCode}');
    debugPrint('${state.username} -> ${response.body}');

    return response;
  }

  // 8. POST /utenti/mario/libri/rename/1984/eragon
  Future<http.Response> renameBook(String oldBook, String newBook) async {
    String path = '/utenti/${state.username}/libri/rename/$oldBook/$newBook';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.post(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    //debugPrint('Renaming book: $oldBook with book $newBook of user: ${state.username}');
    debugPrint(
        'POST /utenti/${state.username}/libri/rename/$oldBook/$newBook response status: ${response.statusCode}');

    return response;
  }

  // 10. DELETE /utenti/mario/libri/remove/eragon
  Future<http.Response> deleteBook(String bookTitle) async {
    String path = '/utenti/${state.username}/libri/remove/$bookTitle';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response = await http
        .delete(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    //debugPrint('Deleting book: $bookTitle of user: ${state.username}');
    debugPrint(
        'DELETE /utenti/${state.username}/libri/remove/$bookTitle response status: ${response.statusCode}');

    return response;
  }

  // 12. DELETE /utenti/remove/mario
  Future<http.Response> deleteUser() async {
    String path = '/utenti/remove/${state.username}';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response = await http
        .delete(url, headers: {'Cookie': state.jwtCookieSession ?? ''});
    //debugPrint('Deleting user: ${state.username}');
    debugPrint(
        'DELETE /utenti/remove/${state.username} response status: ${response.statusCode}');

    return response;
  }
}
