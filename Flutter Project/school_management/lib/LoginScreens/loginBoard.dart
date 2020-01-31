import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management/appThemeColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'teacherandparents.dart';
import 'parentsLoginScreen.dart';
import 'teacherLoginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBoard extends StatefulWidget {
  final UserAuth auth;

  const LoginBoard({this.auth});
  @override
  _LoginBoardState createState() => _LoginBoardState();
}

class _LoginBoardState extends State<LoginBoard> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  double defaultScreenWidth = 411.0;
  double defaultScreenHeight = 683.0;

  @override
  void initState() {
    super.initState();
    getUserinfo();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);
    return Scaffold(
        backgroundColor: AppThemeColors.accentGray,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Login as",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "niuno",
                        fontSize: 30.0,
                        letterSpacing: 1.2),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.school,
                      size: 55.0,
                      color: AppThemeColors.accentBlue,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '"Childern are nation wealth"',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0,
                          fontFamily: "cursive"),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30.0),
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(400),
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      scrollDirection: Axis.horizontal,
                      itemCount: teacherandparents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: ScreenUtil.getInstance().setHeight(375),
                                width: ScreenUtil.getInstance().setWidth(300),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            teacherandparents[index]["images"]),
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 10,
                                child: InkWell(
                                  onTap: () {
                                    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("You clicked item number $index")));

                                    if (index == 0) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ParentsLoginScreen();
                                      }));
                                    }
                                    if (index == 1) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return TeacherLoginScreen();
                                      }));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppThemeColors.accentBlue,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        teacherandparents[index]["text"],
                                        style: TextStyle(
                                            fontFamily: "niuno",
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future<String> getUserinfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final user = await _auth.currentUser();
    String name = sharedPreferences.getString('name');
    String currentToken = sharedPreferences.getString("facebook");
    print(currentToken);
    print(name);
    if (name == user.displayName) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TeacherLoginScreen(
          userAuth: widget.auth,
          profileData: user);
      }));
    }
    return currentToken;
  }
}
