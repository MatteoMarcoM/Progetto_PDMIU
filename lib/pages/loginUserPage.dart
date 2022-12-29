import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login User Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.people),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                  onChanged: (text) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.password_outlined),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter password',
                  ),
                  onChanged: (text) {},
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Login User'))
          ],
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}
