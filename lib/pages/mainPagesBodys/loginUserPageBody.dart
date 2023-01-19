import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userBookListPage.dart';
import 'package:pdmiu_app_biblioteca/utility/providers.dart';
//import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:pdmiu_app_biblioteca/models/userList.dart';

class LoginUserPageBody extends ConsumerWidget {
  const LoginUserPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = '';
    String password = '';

    return ListView(children: [
      Container(
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
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                        onChanged: (text) {
                          username = text;
                        },
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
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your password',
                        ),
                        onChanged: (text) {
                          password = text;
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
                      if (username != '' && password != '') {
                        // setto l'utente corrente
                        //currentUserNameProvider.overrideWithValue(username);

                        //UserList userList = ref.watch(userListProvider.notifier);

                        //User user = userList.selectUser(username);
                        User user = ref.watch(currentUserProvider.notifier);
                        user.state =
                            UserData(username: username, password: password);

                        // effettuo il login e ottengo il JWT di autenticazione
                        final response = await user.loginJWT();

                        if (response.statusCode == 200) {
                          // apro la pagina dell'utente
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserBookListPage()),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Request failed with status: ${response.statusCode}')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Invalid Username or Password!')));
                      }
                    },
                    child: const Text('Login !')),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
