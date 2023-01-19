import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class UserListPageBody extends StatelessWidget {
  const UserListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpHelper.getUsers(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Connection Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final response = snapshot.data!; // as http.Response;

          // return Center(child: _UserListView(response));
          return ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    margin: const EdgeInsets.only(top: 16, bottom: 16),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Center(
                      child: Text(response.body,
                          style: Theme.of(context).textTheme.headline3),
                    ))
              ],
            )
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
