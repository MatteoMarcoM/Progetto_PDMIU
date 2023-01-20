import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeUserDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileUserDrawer.dart';
import '../../utility/providers.dart';
import '../userPagesBodys/userBookListPageBody.dart';
import '../userPagesBodys/userDeleteBookPageBody.dart';

class UserDeleteBookPage extends ConsumerWidget {
  const UserDeleteBookPage({super.key});

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
        title: const Text('Delete Book Page'),
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
                Expanded(child: UserDeleteBookPageBody()),
                Expanded(child: UserBookListPageBody())
              ],
            )
          : const UserDeleteBookPageBody(),
      drawer: (isLarge) ? const LargeUserDrawer() : const MobileUserDrawer(),
    );
  }
}
