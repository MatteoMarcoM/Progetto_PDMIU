import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/userDrawer.dart';
import '../../utility/providers.dart';

class UserAddBookPage extends ConsumerWidget {
  const UserAddBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = '';

    // ottengo l'utente
    User user = ref.watch(marioProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book Page'),
        actions: [
          IconButton(
              onPressed: () {
                // setstate o ref.watch?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: ListView(children: [
        Container(
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
                      onPressed: () async {
                        if (title != '') {
                          final response = await user.addBook(title);

                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Book added!')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Request failed with status: ${response.statusCode}')));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid title!')));
                        }
                      },
                      child: const Text('Add Book !')),
                )
              ],
            ),
          ),
        ),
      ]),
      drawer: const UserDrawer(),
    );
  }
}
