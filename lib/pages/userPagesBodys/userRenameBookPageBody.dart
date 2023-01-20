import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../utility/providers.dart';

class UserRenameBookPageBody extends ConsumerWidget {
  const UserRenameBookPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String oldTitle = '';
    String newTitle = '';

    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    return ListView(children: [
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
