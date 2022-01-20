//import 'dart:async';

import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_todo_app1/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 4), () {
      Route newRoute =
          MaterialPageRoute(builder: (context) => const MainPage());
      Navigator.push(context, newRoute);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(50.0),
        child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/rcc_logo.jpg"),
            child: CircularProgressIndicator(),
            radius: 10,
            backgroundColor: Colors.white),
      ),
    );
  }
}
