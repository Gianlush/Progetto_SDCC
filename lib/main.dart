import 'package:flutter/material.dart';
import 'package:frontend_sdcc_flutter/pages/HomePage.dart';
import 'package:frontend_sdcc_flutter/pages/LoginPage.dart';
import 'package:frontend_sdcc_flutter/pages/ReviewsPage.dart';

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
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(Colors.black45))),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}