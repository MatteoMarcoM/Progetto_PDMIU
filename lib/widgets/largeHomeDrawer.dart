import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPages/biblioHomePage.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPages/registerUserPage.dart';

class LargeHomeDrawer extends StatelessWidget {
  const LargeHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
            decoration: FlutterLogoDecoration(),
            child: Text("Large Home drawer")),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Homepage / Lista utenti"),
          subtitle: const Text("Homepage e Accedi al servizio tramite login"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text("Registra / Login utente"),
          subtitle: const Text("Registra un utente al servizio o fai Login"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const RegisterUserPage()),
                (route) => false);
          },
        ),
      ],
    ));
  }
}
