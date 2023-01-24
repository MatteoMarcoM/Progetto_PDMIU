import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/main.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/loginUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/pages/mainPagesBodys/registerUserPageBody.dart';
import 'package:pdmiu_app_biblioteca/widgets/largeHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';

class RegisterUserPage extends ConsumerWidget {
  const RegisterUserPage({super.key});

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
          : const RegisterUserPageBody(),
      drawer: (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer(),
    );
  }
}
