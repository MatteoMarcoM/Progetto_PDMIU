import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';
//import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class RegisterUserPage extends StatelessWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User Page'),
      ),
      body: Container(
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
                        child: const Icon(Icons.people)),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                        onChanged: (text) {},
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
                        child: const Icon(Icons.password_outlined)),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                        onChanged: (text) {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Register User')),
              )
            ],
          ),
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}
