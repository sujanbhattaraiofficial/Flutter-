import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_management/appThemeColors.dart';
import './OnboardingScreen/walkThroughScreens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 100),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WalKThroughScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: Container(
        color: AppThemeColors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: AppThemeColors.white,
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    child: Icon(
                      Icons.school,
                      size: 55.0,
                      color: AppThemeColors.accentBlue,
                    ),
                  ),
                  Text(
                    "Welcome to saint",
                    style: TextStyle(
                        fontFamily: "niuno",
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                  Text(
                    "joseph's secondary school.",
                    style: TextStyle(
                        fontFamily: "niuno",
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/school1.png"), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.011,
            ),
            Text(
              "Loading please wait...",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "niuno"),
            ),
          ],
        ),
      ),
    );
  }
}
