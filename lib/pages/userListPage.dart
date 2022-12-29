import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User Page'),
      ),
      body: FutureBuilder(
        future: httpHelper.getUsers(),
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
      drawer: const HomeDrawer(),
    );
  }
}
