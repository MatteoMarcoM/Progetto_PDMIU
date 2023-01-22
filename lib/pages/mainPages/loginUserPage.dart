import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/loginUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/registerUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/userPages/userBookListPage.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';
import '../../utility/providers.dart';
//import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;
import 'package:pdmiu_app_biblioteca/models/userList.dart';

class LoginUserPage extends ConsumerWidget {
  const LoginUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Expanded(child: RegisterUserPageBody()),
                Expanded(child: LoginUserPageBody())
              ],
            )
          : const LoginUserPageBody(),
      drawer: (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer(),
    );
  }
}
