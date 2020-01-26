import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:school_management/LoginScreens/loginBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLoginScreen extends StatefulWidget {
  FirebaseUser profileData;
  FacebookLogin loginFacebook;
  TeacherLoginScreen({this.profileData, this.loginFacebook});

  @override
  _TeacherLoginScreenState createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ProgressDialog progressDialog;
  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(message: "Logging out please wait..");
    return Scaffold(
      appBar: AppBar(
        title: Text("facebook Login"),
        elevation: 4.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              progressDialog.show();
              Timer(Duration(seconds: 5), () {
                signOut().whenComplete(() {
                  print(widget.profileData.displayName);
                });
              });
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Card(
        child: Container(
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(widget.profileData.photoUrl),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text("welcome" + " " + widget.profileData.displayName),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await widget.loginFacebook.logOut();
    await FirebaseAuth.instance.signOut();
  }
}
