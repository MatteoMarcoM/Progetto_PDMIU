import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/widgets/userDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../../utility/providers.dart';

// "home page" dell'utente
class UserBookListPage extends ConsumerWidget {
  const UserBookListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ottengo l'utente
    User user = ref.watch(marioProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        // oppure fare metodo String user.getUsername()
        title: Text("${user.state.username}'s Book List Page"),
        actions: [
          IconButton(
              onPressed: () {
                // setstate o ref.watch?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: FutureBuilder(
        future: user.getLibri(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Connection Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final response = snapshot.data!; // as http.Response;

            return Center(child: Text(response.body));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      drawer: const UserDrawer(),
    );
  }
}
