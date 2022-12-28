import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //HTTP request API
import 'dart:convert';

const webServerRootPath = 'fuchsia-outstanding-plow.glitch.me';

class User {
  // attributi dell'utente
  String username;
  String password;
  List<String>? listaLibri;
  bool? jwtScaduto;
  String? jwtCookieSession;

  // costruttore dell'utente
  User({
    required this.username,
    required this.password,
    this.listaLibri,
    this.jwtScaduto,
    this.jwtCookieSession,
  });

  // metodi per richieste dell'utente al server tramite API HTTP

  // 2. PUT /utenti/register/mario/passwordDiMario
  void registerUser() async {
    String path = '/utenti/register/$username/$password';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.put(url);
    debugPrint('User registered: $username');
  }

  // 3. GET /utenti/mario
  Future<http.Response> getBiblio() async {
    var url = Uri.https(webServerRootPath, '/utenti/$username');

    var response = await http.get(url);
    debugPrint('Get mario response status: ${response.statusCode}');
    debugPrint(response.body);

    return response;
  }

  // sessione tramite JWT
  // 4. POST /utenti/login/jwt
  // con header Authorization: Basic mario:passwordDiMario
  void loginJWT() async {
    String path = '/utenti/login/jwt';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    // NB le credenziali sono codificate in Base64 da UTF-8
    String credentials = '$username:$password';
    String encoded = base64.encode(utf8.encode(credentials));

    http.Response response =
        await http.post(url, headers: {'Authorization': 'Basic $encoded'});
    debugPrint('$username login with JWT status: ${response.statusCode}');

    var sessionCookie = response.headers['set-cookie'];
    debugPrint('Cookie Session JWT: $sessionCookie');

    jwtCookieSession = sessionCookie;
    jwtScaduto = false;
  }

  // 5. GET /utenti/mario/secret/jwt
  // passando il cookie session JWT ottenuto precedentemente
  Future<http.Response> getSecret() async {
    var url = Uri.https(webServerRootPath, '/utenti/${username}/secret/jwt');

    var response =
        await http.get(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Get mario secret response status: ${response.statusCode}');
    debugPrint(response.body);

    return response;
  }

  // 6. PUT /utenti/mario/libri/add/1984
  void addBook(String bookTitle) async {
    String path = '/utenti/$username/libri/add/$bookTitle';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.put(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Added book: $bookTitle at user: $username');
    debugPrint('Added book status: ${response.statusCode}');
  }

  // 7. 9. 11. GET /utenti/mario/libri
  Future<http.Response> getLibri() async {
    var url = Uri.https(webServerRootPath, '/utenti/${username}/libri');

    var response =
        await http.get(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Get mario libri response status: ${response.statusCode}');
    debugPrint(response.body);

    return response;
  }

  // 8. POST /utenti/mario/libri/rename/1984/eragon
  void renameBook(String oldBook, String newBook) async {
    String path = '/utenti/$username/libri/rename/$oldBook/$newBook';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.post(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Renaming book: $oldBook with book $newBook of user: $username');
    debugPrint('Renaming book status: ${response.statusCode}');
  }

  // 10. DELETE /utenti/mario/libri/remove/eragon
  void deleteBook(String bookTitle) async {
    String path = '/utenti/$username/libri/remove/$bookTitle';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.delete(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Deleting book: $bookTitle of user: $username');
    debugPrint('Deleting book status: ${response.statusCode}');
  }

  // 12. DELETE /utenti/remove/mario
  void deleteUser() async {
    String path = '/utenti/remove/$username';
    var url = Uri.https(
      webServerRootPath,
      path,
    );

    http.Response response =
        await http.delete(url, headers: {'Cookie': jwtCookieSession ?? ''});
    debugPrint('Deleting user: $username');
    debugPrint('Deleting $username status: ${response.statusCode}');
  }
}
