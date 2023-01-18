import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user.dart';
import '../../models/userList.dart';
import '../../utility/providers.dart';
import '../biblioHomePage.dart';

// "home page" dell'utente
class UserAccountPage extends ConsumerWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        // oppure fare metodo String user.getUsername()
        title: Text("${user.state.username}'s Account Page"),
        actions: [
          IconButton(
              onPressed: () {
                // successful login?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: ListView(children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Logout"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_remove_sharp),
          title: const Text("Cancella account"),
          subtitle: const Text("Disiscriviti dal servizio"),
          onTap: () async {
            final response = await user.deleteUser();

            if (response.statusCode == 200) {
              // rimuovo l'utente dalla lista utenti
              //UserList userList = ref.watch(userListProvider.notifier);
              //userList.removeUser(user.state.username);

              // reset notifier
              user.state =
                  UserData(username: 'mario', password: 'passwordDiMario');

              // apro la pagina
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const BiblioHomePage()),
                  (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Request failed, try reloading JWT!!')));
            }
          },
        ),
      ]),
    );
  }
}
