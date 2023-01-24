import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userAccountPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userDeleteBookPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userRenameBookPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userAddBookPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userBookListPage.dart';

class MobileUserDrawer extends ConsumerWidget {
  const MobileUserDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
            decoration: FlutterLogoDecoration(),
            child: Text("Mobile User drawer")),
        ListTile(
          leading: const Icon(Icons.my_library_books),
          title: const Text("Lista Libri"),
          subtitle: const Text("Mostra la lista dei libri"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const UserBookListPage()),
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
          leading: const Icon(Icons.person_pin),
          title: const Text("Impostazioni Account"),
          subtitle: const Text("Logout, Disiscriviti"),
          onTap: () {
            // questa va messa sopra allo stack NB
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserAccountPage()));
          },
        ),
      ],
    ));
  }
}
