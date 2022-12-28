import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/main.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
            decoration: FlutterLogoDecoration(), child: Text("Home drawer")),
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
          title: const Text("Pagina secondaria"),
          subtitle: const Text("Apri navigazione bottom bar"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
        ListTile(
          title: const Text("Pagina secondaria"),
          subtitle: const Text("Apri navigazione con schede"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text("About"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BiblioHomePage()),
                (route) => false);
          },
        ),
      ],
    ));
  }
}
