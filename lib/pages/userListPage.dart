import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';
//import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User Page'),
      ),
      body: const Center(child: Text('implementation listview')),
      drawer: const HomeDrawer(),
    );
  }
}
