import 'package:flutter/material.dart';
import 'package:my_todo_app1/main_page.dart';
import 'package:my_todo_app1/splash.dart';

import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //This HomeView() is a class in home_view.dart
      home: const SplashScreen(),
    );
  }
}

