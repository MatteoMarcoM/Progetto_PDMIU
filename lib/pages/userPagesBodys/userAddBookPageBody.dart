import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../utility/providers.dart';

class UserAddBookPageBody extends ConsumerWidget {
  const UserAddBookPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = '';
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blueGrey.shade100,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset.fromDirection(120, 8),
                          color: Colors.blue.shade100)
                    ]),
                child: const Center(
                    child: Text('Add a Book Title',
                        style: TextStyle(fontSize: 20))),
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
    ]);
  }
}
