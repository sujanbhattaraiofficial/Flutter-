import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splashScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
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

