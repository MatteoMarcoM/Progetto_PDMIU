import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import '../../utility/providers.dart';

class UserRenameBookPageBody extends ConsumerWidget {
  const UserRenameBookPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String oldTitle = '';
    String newTitle = '';

    // ottengo l'utente
    User user = ref.watch(currentUserProvider.notifier);

    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.deepOrange.shade500,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset.fromDirection(120, 8),
                            color: Colors.black.withAlpha(100))
                      ]),
                  child: const Center(
                      child: Text('Rename a Book',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(Icons.bookmark_remove_outlined)),
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
                        child: const Icon(Icons.bookmark_add_outlined)),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter new book's title",
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
                    onPressed: () async {
                      if (oldTitle != '' && newTitle != '') {
                        final response =
                            await user.renameBook(oldTitle, newTitle);

                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Book renamed!')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Request failed with status: ${response.statusCode}')));
                        }
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
    ]);
  }
}
