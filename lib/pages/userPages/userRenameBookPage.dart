import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../utility/providers.dart';
import '../../widgets/largeUserDrawer.dart';
import '../userPagesBodys/userBookListPageBody.dart';
import '../userPagesBodys/userRenameBookPageBody.dart';

class UserRenameBookPage extends ConsumerWidget {
  const UserRenameBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String oldTitle = '';
    String newTitle = '';

    // ottengo l'utente
    //String username = ref.watch(currentUserNameProvider);
    //User user = ref.watch(specificUserProvider(username));

    User user = ref.watch(currentUserProvider.notifier);

    final width = MediaQuery.of(context).size.width;
    final isLarge = width > largeScreenBreakpoint;

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
                Expanded(child: UserRenameBookPageBody()),
                Expanded(child: UserBookListPageBody())
              ],
            )
          : const UserRenameBookPageBody(),
      drawer: (isLarge) ? const LargeUserDrawer() : const MobileUserDrawer(),
    );
  }
}
