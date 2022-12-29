import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/biblioHomePage.dart';
import 'package:pdmiu_app_biblioteca/pages/loginUserPage.dart';
import 'package:pdmiu_app_biblioteca/pages/registerUserPage.dart';
import 'package:pdmiu_app_biblioteca/pages/userListPage.dart';

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
          leading: const Icon(Icons.app_registration),
          title: const Text("Registra utente"),
          subtitle: const Text("Registra un utente al servizio"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const RegisterUserPage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.login_outlined),
          title: const Text("Login utente"),
          subtitle: const Text("Accedi al servizio tramite login"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginUserPage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.supervised_user_circle_sharp),
          title: const Text("Lista utenti"),
          subtitle: const Text("Lista degli utenti registrati al servizio"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const UserListPage()),
                (route) => false);
          },
        ),
      ],
    ));
  }
}
