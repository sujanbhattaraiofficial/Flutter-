import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      title: "My CV App",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My CV"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/sujan.jpg"),
                          radius: 50.0,
                        ),
                        Text(
                          "Sujan Bhattarai",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text("App developer",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Currently a student of BE Software at Gandaki College of Engineering and Science.",
                          style:
                              TextStyle(fontSize: 20.0, fontFamily: "Nunito"),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  "Social Links",
                  style: TextStyle(fontSize: 20, fontFamily: "Nunito"),
                ),
              ),
              Card(
                elevation: 3.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        launch("https://facebook.com/SujanBhattaraiOfficial");
                      },
                      icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () {
                        launch("https://instagram.com/sujanbhattaraiofficial");
                      },
                      icon: Icon(FontAwesomeIcons.instagram, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {
                        launch(
                            "https://linkedin.com/in/sujan-bhattarai-0b7669156/");
                      },
                      icon: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launch("https://twitter.com/Xujnofficial");
                      },
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blueAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launch("https://github.com/sujanbhattaraiofficial");
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Text(
                    "Skills",
                    style: TextStyle(fontFamily: "Nunito", fontSize: 20.0),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/web.jpeg"),
                        radius: 25.0,
                      ),
                      title: Text("Web Development"),
                      subtitle: Text("Html and css"),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 3.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/app.jpg"),
                    radius: 25.0,
                  ),
                  title: Text("App Development"),
                  subtitle: Text("Dart,flutter and java"),
                ),
              ),
              Card(
                elevation: 3.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/content.jpg"),
                    radius: 25.0,
                  ),
                  title: Text("Content Writer"),
                  subtitle: Text(
                      "Technical Writing,Ghostwriting,Busniness Writing,Copywriting etc."),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
