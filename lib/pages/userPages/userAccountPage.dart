import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeUserDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../models/user.dart';
import '../../models/userList.dart';
import '../../utility/providers.dart';
import '../mainPages/biblioHomePage.dart';

// "home page" dell'utente
class UserAccountPage extends ConsumerWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    final width = MediaQuery.of(context).size.width;
    final isLarge = width > largeScreenBreakpoint;

    return Scaffold(
      appBar: AppBar(
        // oppure fare metodo String user.getUsername()
        title: const Text("Account Info and settings"),
        actions: [
          IconButton(
              onPressed: () {
                // successful login?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: (isLarge)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: AccountButtonsView()),
                Expanded(child: ListView(children: const [DetailsView()])),
              ],
            )
          : ListView(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AccountButtonsView(),
                    DetailsView(),
                  ]),
            ]),
    );
  }
}

class DetailsView extends ConsumerWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(currentUserProvider.notifier);

    return Padding(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: Text("Dettagli dell'Account",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
              Container(
                height: 30,
              ),
              Container(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Center(
                      child: Text(
                        'Username: ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${user.getName()}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cookie session JWT: ',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Flexible(
                        child: Text('${user.state.jwtCookieSession}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white)))
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class AccountButtonsView extends ConsumerWidget {
  const AccountButtonsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(currentUserProvider.notifier);

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  child: Text("Impostazioni dell'Account",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Logout"),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const BiblioHomePage()),
                    (route) => false);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
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
          )
        ]);
  }
}
