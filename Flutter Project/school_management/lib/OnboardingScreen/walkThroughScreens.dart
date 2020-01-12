import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:school_management/appThemeColors.dart';

class WalKThroughScreen extends StatefulWidget {
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
          done: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 1.0,
            decoration: BoxDecoration(
                color: AppThemeColors.accentBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0))),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "niuno",
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          pages: getPages(),
          onDone: () {},
        ),
      ),
    );
  }
}
