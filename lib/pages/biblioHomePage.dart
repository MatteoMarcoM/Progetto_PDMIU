import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

class BiblioHomePage extends StatelessWidget {
  const BiblioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: httpHelper.getRootWebSite(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Connection Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final response = snapshot.data!; // as http.Response;

                  return Center(
                      child: Text(
                          'Connesso alla root del servizio: ${response.body}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
            // istruzioni servizio in ListView
          ],
        ),
      ),
      drawer: const MobileHomeDrawer(),
    );
  }
}
