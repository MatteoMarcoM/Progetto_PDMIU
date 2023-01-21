import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/pages/userPagesBodys/userAddBookPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../utility/providers.dart';
import '../../widgets/largeUserDrawer.dart';
import '../userPagesBodys/userBookListPageBody.dart';

class UserAddBookPage extends ConsumerWidget {
  const UserAddBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = '';

    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

    return Scaffold(
      appBar: AppBar(
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
          : const UserAddBookPageBody(),
      drawer: (isLarge) ? const LargeUserDrawer() : const MobileUserDrawer(),
    );
  }
}
