import 'package:flutter/material.dart';
import 'appThemeColors.dart';
import 'splashScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

