import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splashScreen.dart';
import 'dart:async';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseUser firebaseUser;
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: "e-School",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
 

