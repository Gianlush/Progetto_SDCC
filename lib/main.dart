import 'package:flutter/material.dart';

import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Library',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}