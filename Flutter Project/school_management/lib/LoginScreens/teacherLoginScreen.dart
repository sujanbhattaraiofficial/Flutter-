import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:school_management/LoginScreens/SocialAuthentication/currentUserInfo.dart';
import 'package:school_management/LoginScreens/SocialAuthentication/facebookAuthentication.dart';

class TeacherLoginScreen extends StatefulWidget {
  @override
  _TeacherLoginScreenState createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  String image1, name1;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  ProgressDialog progressDialog;
  CurrentUserInfo info = new CurrentUserInfo();
  String name = "", image = "";

  @override
  void initState() {
    super.initState();
    ok().then((value) {
      setState(() {
        name = value.displayName;
        image = value.photoUrl;
      });
    });
  }

  Future<FirebaseUser> ok() async {
    return await CurrentUserInfo.fetchUserData();
  }

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
                FacebookAuthenticationBase facebookAuthenticationBase =
                    new FacebookAuthenticationBase();
                facebookAuthenticationBase.logOutFacebook();
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
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Text(name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
