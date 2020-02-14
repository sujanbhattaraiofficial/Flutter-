import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/LoginScreens/loginBoard.dart';
import 'package:school_management/LoginScreens/teacherLoginScreen.dart';

Route<String> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/teacher':
      return MaterialPageRoute(builder: (context) {
        return TeacherLoginScreen();
      });
    case '/loginBoard':
      return MaterialPageRoute(builder: (context) {
        return LoginBoard();
      });
    default:
      return null;
  }
}
