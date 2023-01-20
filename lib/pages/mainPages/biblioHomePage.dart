import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/biblioHomePageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/userListPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class BiblioHomePage extends StatelessWidget {
  const BiblioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

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
          : const BiblioHomePageBody(),
      drawer: (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer(),
    );
  }
}
