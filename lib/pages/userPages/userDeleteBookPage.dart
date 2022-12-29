import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/userDrawer.dart';

class UserDeleteBookPage extends StatelessWidget {
  const UserDeleteBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';

    // da fare con current user e provider
    User user = User(username: 'mario', password: 'passwordDiMario');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Book Page'),
        actions: [
          IconButton(
              onPressed: () {
                // setstate o ref.watch?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
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
                          labelText: "Enter book's title",
                        ),
                        onChanged: (text) {
                          title = text;
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
                      if (title != '') {
                        user.deleteBook(title);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid title!')));
                      }
                    },
                    child: const Text('Delete Book !')),
              )
            ],
          ),
        ),
      ),
      drawer: const UserDrawer(),
    );
  }
}
