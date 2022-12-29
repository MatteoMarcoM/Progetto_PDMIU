import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/pages/biblioHomePage.dart';

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
