import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/LoginScreens/SocialAuthentication/googleAuthentication.dart';
import 'package:school_management/LoginScreens/teacherLoginScreen.dart';
import 'package:school_management/appThemeColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SocialMediaIcons/mediaIcons.dart';
import 'SocialMediaIcons/customIcons.dart';

class ParentsLoginScreen extends StatefulWidget {
  final UserAuth auth;
  final VoidCallback loggedInGoogle;
  const ParentsLoginScreen({
    Key key,
    this.auth,
    this.loggedInGoogle,
  }) : super(key: key);
  @override
  _ParentsLoginScreenState createState() => _ParentsLoginScreenState();
}

class _ParentsLoginScreenState extends State<ParentsLoginScreen> {
  FacebookAccessToken facebookAccessToken;
  FirebaseUser firebaseUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  double defaultScreenWidth = 411.0;
  double defaultScreenHeight = 683.0;

  @override
  void initState() {
    super.initState();
    // getUserinfo();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(30)),
                  child: Image.asset("assets/parents.jpg"),
                )
              ],
            ),
            SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setWidth(60),
                  right: ScreenUtil.getInstance().setWidth(20),
                  left: ScreenUtil.getInstance().setWidth(20)),
              child: Column(
                children: <Widget>[
                  Text(""),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(130),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.instance.setHeight(250),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0,
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -15.0),
                            blurRadius: 15.0,
                          )
                        ]),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "niuno",
                                fontSize: ScreenUtil.getInstance().setSp(25),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10.0),
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "niuno",
                              fontSize: ScreenUtil.getInstance().setSp(20),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "username",
                                fillColor: AppThemeColors.accentGray,
                                filled: false,
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15.0)),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10.0),
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "niuno",
                              fontSize: ScreenUtil.getInstance().setSp(20),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "password",
                                fillColor: AppThemeColors.accentGray,
                                filled: false,
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15.0)),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontFamily: "niuno",
                                    color: AppThemeColors.accentBlue,
                                    fontSize: 15.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 0.0,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(isSelected),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: Text(
                              "Remember me?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "niuno",
                                  fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Center(
                          child: Container(
                            height: ScreenUtil.getInstance().setHeight(45),
                            width: ScreenUtil.getInstance().setWidth(200),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12.withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ],
                                color: AppThemeColors.accentBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                                child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                fontFamily: "niuno",
                                fontSize: ScreenUtil.getInstance().setSp(20),
                              ),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(15.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login with",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            fontFamily: "niuno",
                            fontSize: ScreenUtil.getInstance().setSp(15),
                          ),
                        ),
                      ),
                      horizontalLine(),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(0.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MediaIcons(
                        clrs: [
                          Color(0xFF102397),
                          Color(0xFF187ADF),
                          Color(0xFF00EAF8)
                        ],
                        iconData: CustomIcons.twitter,
                      ),
                      MediaIcons(
                          clrs: [
                            Color(0xFFff4f38),
                            Color(0xFFff355d),
                          ],
                          iconData: CustomIcons.gplus,
                          ifPressed: () {
                            GoogleOk g = new GoogleOk();
                            g.handleSignIn();
                          }),
                      MediaIcons(
                        clrs: [
                          Color(0xFFa630bc),
                          Color(0xFFbe3978),
                          Color(0xFFeb1475),
                          Color(0xFFdf4083),
                          Color(0xFFf1314f),
                        ],
                        iconData: CustomIcons.instagram,
                      ),
                      MediaIcons(
                        clrs: [
                          Color(0xFF102397),
                          Color(0xFF187ADF),
                          Color(0xFF00EAF8)
                        ],
                        iconData: CustomIcons.facebook,
                        ifPressed: () {
                          initiateFacebook();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "niuno",
                          fontSize: ScreenUtil.getInstance().setSp(15.0),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(5.0),
                      ),
                      Text(
                        "SignUp",
                        style: TextStyle(
                          color: AppThemeColors.accentBlue,
                          fontFamily: "niuno",
                          fontSize: ScreenUtil.getInstance().setSp(15.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }

  bool isSelected = true;

  void _radio() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Widget radioButton(bool isSelected) {
    return Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container());
  }

  Widget horizontalLine() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(1.0),
      width: ScreenUtil.getInstance().setWidth(50.0),
      decoration: BoxDecoration(
        color: AppThemeColors.accentGray,
      ),
    );
  }

  void initiateFacebook() async {
    final facebookLogin = new FacebookLogin();
    FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(['email', 'public_profile']);
    print(facebookLoginResult.status);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.loggedIn:
        facebookLoginSucessfully(facebookLoginResult);
        saveCurrentUserInfo();
        // final token = facebookLoginResult.accessToken.token;
        // final graphResponse = await http.get(
        //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=$token');
        // var profile = json.decode(graphResponse.body);
        // await Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return TeacherLoginScreen(profileData: graphResponse);
        // }));
        // print(profile);

        break;
      case FacebookLoginStatus.cancelledByUser:
        // TODO: Handle this case.
        break;
      case FacebookLoginStatus.error:
        // TODO: Handle this case.
        break;
    }
  }

  Future<String> facebookLoginSucessfully(
      FacebookLoginResult loginResult) async {
    {
      FacebookAccessToken facebookToken = loginResult.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: facebookToken.token);
      firebaseUser = (await _auth.signInWithCredential(credential)).user;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TeacherLoginScreen(
          profileData: firebaseUser,
        );
      }));
      return null;
    }
  }

  Future<FirebaseUser> saveCurrentUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final user = await _auth.currentUser();
    String userName = user.displayName;
    var token = user.getIdToken();
    sharedPreferences.setString("name", userName);
    sharedPreferences.setString("facebook", token.toString());
    return user;
  }
}

abstract class BaseAuth {
  Future<void> signOut();
}

class UserAuth implements BaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await facebookLogin.logOut();
    await FirebaseAuth.instance.signOut();
    await _auth.signOut();
    firebaseUser = await _auth.currentUser();
    firebaseUser = null;
    print(firebaseUser.displayName);
  }
}
