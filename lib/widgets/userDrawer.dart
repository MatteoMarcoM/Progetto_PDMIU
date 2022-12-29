import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userDeleteBookPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userRenameBookPage.dart';
import '../models/user.dart';
import 'package:pdmiu_app_biblioteca/pages/biblioHomePage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userAddBookPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userBookListPage.dart';

// da fare con current user e provider
final userMario = User(username: 'mario', password: 'passwordDiMario');

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
            decoration: FlutterLogoDecoration(), child: Text("User drawer")),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Homepage"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.my_library_books),
          title: const Text("Lista Libri"),
          subtitle: const Text("Mostra la lista dei libri"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => UserBookListPage(user: userMario)),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark_add),
          title: const Text("Aggiungi Libro"),
          subtitle: const Text("Aggiungi un libro"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const UserAddBookPage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark_remove_rounded),
          title: const Text("Rimuovi Libro"),
          subtitle: const Text("Rimuovi un libro"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const UserDeleteBookPage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.change_circle),
          title: const Text("Rinomina Libro"),
          subtitle: const Text("Rinomina un libro"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const UserRenameBookPage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_remove_sharp),
          title: const Text("Cancella account"),
          subtitle: const Text("Disiscriviti dal servizio"),
          onTap: () {
            userMario.deleteUser();

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
      ],
    ));
  }
}
