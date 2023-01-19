import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/biblioHomePageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/userListPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/responsiveHomeDrawer.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ottengo la attuale grandezza dello schermo
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Home Page'),
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
      drawer: const ResponsiveHomeDrawer(),
    );
  }
}
