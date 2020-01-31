import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'parentsLoginScreen.dart';

class TeacherLoginScreen extends StatefulWidget {
  final BaseAuth userAuth;
  final FirebaseUser profileData;
  TeacherLoginScreen({this.profileData, this.userAuth});

  @override
  _TeacherLoginScreenState createState() => _TeacherLoginScreenState(this.userAuth);
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  ProgressDialog progressDialog;
  final BaseAuth userAuth;
  _TeacherLoginScreenState(this.userAuth);
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
              Timer(Duration(seconds: 3), () {
                signOut();
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("name");
    await _auth.signOut();
    await userAuth.signOut();
  }
}
