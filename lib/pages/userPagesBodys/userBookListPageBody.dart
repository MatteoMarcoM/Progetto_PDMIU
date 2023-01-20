import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../../utility/providers.dart';

// "home page" dell'utente
class UserBookListPageBody extends ConsumerWidget {
  const UserBookListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    return FutureBuilder(
      future: user.getLibri(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Connection Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final response = snapshot.data!; // as http.Response;

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
