import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/userDrawer.dart';

class UserRenameBookPage extends StatelessWidget {
  const UserRenameBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    String oldTitle = '';
    String newTitle = '';

    // da fare con current user e provider
    User user = User(username: 'mario', password: 'passwordDiMario');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rename Book Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(Icons.book)),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter old book's title",
                        ),
                        onChanged: (text) {
                          oldTitle = text;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(Icons.book)),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter book's title",
                        ),
                        onChanged: (text) {
                          newTitle = text;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      if (oldTitle != '' && newTitle != '') {
                        user.renameBook(oldTitle, newTitle);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid book titles!')));
                      }
                    },
                    child: const Text('Rename Book !')),
              )
            ],
          ),
        ),
      ),
      drawer: const UserDrawer(),
    );
  }
}
