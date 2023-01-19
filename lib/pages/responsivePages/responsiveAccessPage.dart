import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/biblioHomePageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/loginUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';

import '../../widgets/responsiveHomeDrawer.dart';
import '../pagesBodys/registerUserPageBody.dart';

class ResponsiveAccessPage extends StatelessWidget {
  const ResponsiveAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ottengo la attuale grandezza dello schermo
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Access Page'),
      ),
      body: (isLarge)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: RegisterUserPageBody()),
                Expanded(child: LoginUserPageBody())
              ],
            )
          : const BiblioHomePageBody(),
      drawer: const ResponsiveHomeDrawer(),
    );
  }
}
