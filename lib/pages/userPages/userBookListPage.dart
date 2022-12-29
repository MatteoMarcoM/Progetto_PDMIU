import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/userDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;
import '../../models/user.dart';

// "home page" dell'utente
class UserBookListPage extends StatefulWidget {
  const UserBookListPage({super.key, required this.user});
  final User user;

  @override
  State<UserBookListPage> createState() => _UserBookListPageState(user: user);
}

class _UserBookListPageState extends State<UserBookListPage> {
  // default user
  final User user;

  _UserBookListPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.username}'s Book List Page"),
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
