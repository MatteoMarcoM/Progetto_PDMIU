import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/homeDrawer.dart';
import 'package:pdmiu_app_biblioteca/utility/httpGetHelper.dart' as httpHelper;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Biblioteca',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const BiblioHomePage(),
    );
  }
}

class BiblioHomePage extends StatefulWidget {
  const BiblioHomePage({super.key});

  @override
  State<BiblioHomePage> createState() => _BiblioHomePageState();
}

class _BiblioHomePageState extends State<BiblioHomePage> {
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
                  //final response = snapshot.data! as http.Response;

                  return Center(
                      child: Text(
                          'Connesso alla root del servizio: ${snapshot.data!.body}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}
