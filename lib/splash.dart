//import 'dart:async';

import 'dart:async';
// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app1/auth_view/login.dart';
import 'package:my_todo_app1/main_page.dart';

import 'auth_view/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 4), () {
      Route newRoute =
          MaterialPageRoute(builder: (context) => Newlogin( firebaseApp: Firebase.app(),));
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
    return SafeArea(
      child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 250,
                ),
                CircleAvatar(
                    backgroundImage: AssetImage("assets/images/rcc_logo.jpg"),
                    radius: 60,
                    backgroundColor: Colors.white),
                SizedBox(height: 15),
                Text("Reapers Discipleship App 1.0",
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.italic,
                        color: Colors.black)),
                SizedBox(height: 10),
                SizedBox(width: 70, child: LinearProgressIndicator()),
                SizedBox(height: 280),
                Text("We Believe There Is More",
                    style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.none,
                        fontStyle: FontStyle.italic,
                        color: Colors.green)),
              ],
            ),
          )),
    );
  }
}
