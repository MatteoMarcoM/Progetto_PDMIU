import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/biblioHomePageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/userListPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > largeScreenBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca App'),
      ),
      body: (isLarge)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: BiblioHomePageBody()),
                Expanded(child: UserListPageBody())
              ],
            )
          : const UserListPageBody(),
      drawer: (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer(),
    );
  }
}
