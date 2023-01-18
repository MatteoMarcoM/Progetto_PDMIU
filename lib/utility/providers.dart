import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/userList.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

// providers forniti tramite riverpod ai widget dell'app

final currentUserProvider = StateNotifierProvider<User, UserData>(
  (ref) => User(UserData(username: 'mario', password: 'passwordDiMario')),
);

/*
// utente di default / testing
final marioProvider = StateNotifierProvider<User, UserData>(
  (ref) => User(UserData(username: 'mario', password: 'passwordDiMario')),
);

// versione semplificata con accesso possibile solo da unica app

final userListProvider =
    StateNotifierProvider<UserList, List<User>>((ref) => UserList([]));


// Provider principale basato su un oggetto StateNotifier UserList
// possibile accesso da più app?

final userListProvider = FutureProvider<List<String>>(
  (ref) async {
    var url = Uri.https(webServerRootPath, '/utenti');

    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
          "Failed to access resource (status code ${response.statusCode}");
    }

    List<dynamic> json = jsonDecode(response.body);
    final usersList = json
        .cast<Map<String, dynamic>>()
        .map((e) => User(UserData()))
        .toList();

    return usersList;
  },
);

// ottengo un utente specifico con una famiglia di provider che ascoltano ad un provider di
// lista di utenti per avere un utente specifico identificato da uno username
final specificUserProvider = Provider.family<User, String>((ref, userName) {
  debugPrint("Specific provider rebuilding for $userName");
  return ref
      .watch(userListProvider)
      .where((user) => user.getName() == userName)
      .single;
});

// utente di default nullo
final currentUserNameProvider = Provider<String>((ref) => '');

// current user provider
final currentUserProvider = Provider<User>((ref) {
  String username = ref.watch(currentUserNameProvider);

  if (username != '') {
    return ref.watch(specificUserProvider(username));
  } else {
    throw UnimplementedError();
  }
});
*/