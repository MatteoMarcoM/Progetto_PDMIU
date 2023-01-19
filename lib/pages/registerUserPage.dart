import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/models/userList.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/loginUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/pagesBodys/registerUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/responsivePages/responsiveAccessPage.dart';
import 'package:pdmiu_app_biblioteca/utility/providers.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeHomeDrawer.dart';
//import 'package:pdmiu_app_biblioteca/pages/userPages/userBookListPage.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/responsiveHomeDrawer.dart';
//import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class RegisterUserPage extends ConsumerWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User Page'),
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
          : const RegisterUserPageBody(),
      drawer: (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer(),
    );
  }
}
