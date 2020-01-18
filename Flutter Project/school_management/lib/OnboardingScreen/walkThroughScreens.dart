import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:school_management/ButtonDesign/animatedButton.dart';
import 'package:school_management/appThemeColors.dart';
import 'package:school_management/LoginScreens/loginBoard.dart';

class WalKThroughScreen extends StatefulWidget {
  final PageController pageController;
  final int currentPage;

  const WalKThroughScreen({Key key, this.pageController, this.currentPage})
      : super(key: key);
  @override
  _WalKThroughScreenState createState() => _WalKThroughScreenState();
}

class _WalKThroughScreenState extends State<WalKThroughScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/education.png"),
        title: "Education",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        footer: Text(""),
        decoration: PageDecoration(
          titleTextStyle: PageDecoration().titleTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
              ),
          bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
                fontSize: 20.0,
              ),
        ),
      ),
      PageViewModel(
        image: Image.asset("assets/learning.png"),
        title: "Learning",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        footer: Text(""),
        decoration: PageDecoration(
          titleTextStyle: PageDecoration().titleTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
              ),
          bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
                fontSize: 20.0,
              ),
        ),
      ),
      PageViewModel(
        image: Image.asset("assets/teacher.png"),
        title: "Teaching",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        footer: Text(""),
        decoration: PageDecoration(
          titleTextStyle: PageDecoration().titleTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
              ),
          bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(
                color: Colors.black,
                fontFamily: "niuno",
                fontSize: 20.0,
              ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 50.0),
        child: IntroductionScreen(
          globalBackgroundColor: AppThemeColors.white,
          showSkipButton: true,
          skip: Text(
            "Skip!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "niuno",
              fontSize: 22.0,
            ),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            size: 30.0,
          ),
          done: AnimatedButton(
            onTabDone: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginBoard();
                }),
              );
            },
            animationDuration: const Duration(milliseconds: 2000),
            initialText: "Ok",
            finalText: "Done",
            iconData: Icons.done,
            iconSize: 20.0,
            buttonStyle: ButtonStyle(
                primaryColor: AppThemeColors.accentBlue,
                secondaryColor: Colors.white,
                elevation: 20.0,
                borderRadius: 10.0,
                initialTextStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.020,
                  fontWeight: FontWeight.bold,
                  fontFamily: "niuno",
                  color: Colors.white,
                ),
                finalTextStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.020,
                  fontWeight: FontWeight.bold,
                  fontFamily: "niuno",
                  color: Colors.green.shade600,
                )),
          ),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              activeColor: AppThemeColors.deepGreen,
              spacing: const EdgeInsets.symmetric(horizontal: 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          pages: getPages(),
          onDone: () {
            return null;
          },
        ),
      ),
    );
  }
}
