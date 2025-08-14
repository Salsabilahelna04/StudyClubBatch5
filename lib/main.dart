import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const Home (title: ''),
        '/profile': (context) => const Profile (),
      },
    );
  }
}