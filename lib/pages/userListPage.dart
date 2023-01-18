import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User Page'),
      ),
      body: FutureBuilder(
        future: httpHelper.getUsers(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Connection Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final response = snapshot.data!; // as http.Response;

            // return Center(child: _UserListView(response));
            return ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Center(
                        child: Text(response.body,
                            style: Theme.of(context).textTheme.headline3),
                      ))
                ],
              )
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      drawer: const HomeDrawer(),
    );
  }
}

/*
per codifica JSON non funziona !

class _UserListView extends StatelessWidget {
  final http.Response response;
  _UserListView(this.response);

  @override
  Widget build(BuildContext context) {
    // ottengo ili JSON dalla risposta
    List<dynamic> json = jsonDecode(response.body);

    // subject e content
    final userList = json
        .cast<Map<String, dynamic>>()
        .map((e) => _PrintableUserList.fromJson(e))
        .toList()
        .single;

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 120,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(userList.subject,
                  style: Theme.of(context).textTheme.headline3)),
          Container(
              height: 120,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(userList.content,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1))
        ]);
  }
}

class _PrintableUserList {
  final String subject;
  final String content;

  //_PrintableUserList(this.subject, this.content);

  // costruttore da JSON
  // NB la password non e' accessibile da fuori
  _PrintableUserList.fromJson(Map<String, dynamic> json)
      : subject = json['subj'] as String,
        content = json['content'] as String;
}
*/