import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../../utility/providers.dart';
import '../../widgets/largeUserDrawer.dart';
import '../userPagesBodys/userAddBookPageBody.dart';
import '../userPagesBodys/userBookListPageBody.dart';

// "home page" dell'utente
class UserBookListPage extends ConsumerWidget {
  const UserBookListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    final width = MediaQuery.of(context).size.width;
    final isLarge = width > largeScreenBreakpoint;

    return Scaffold(
      appBar: AppBar(
        // oppure fare metodo String user.getUsername()
        title: Text("${user.state.username}'s Account"),
        actions: [
          IconButton(
              onPressed: () {
                // setstate o ref.watch?
                user.loginJWT();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: (isLarge)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: UserAddBookPageBody()),
                Expanded(child: UserBookListPageBody())
              ],
            )
          : const UserBookListPageBody(),
      drawer: (isLarge) ? const LargeUserDrawer() : const MobileUserDrawer(),
    );
  }
}
