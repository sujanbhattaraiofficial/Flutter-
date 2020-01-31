import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: "message Card Application",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String message = "";
  Color textColor = Colors.white;
  Color textColor1 = Colors.red;
  TextField _textField;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: textColor1,
          title: Text("Message card"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: 250,
                    color: textColor1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Center(
                          child: Text(
                        message,
                        style: TextStyle(fontSize: 25.0, color: textColor),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller,
                    cursorColor: textColor1,
                    onChanged: (String newValue) {
                      setState(() {
                        message = newValue;
                        print(newValue);
                      });
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.message,
                          color: textColor1,
                        ),
                        border: OutlineInputBorder(),
                        helperText: "Writer your message..",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor1))),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      elevation: 3.0,
                      onPressed: () {
                        controller.clear();
                      },
                      child: Text(
                        "Clear Message!",
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      color: textColor1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            textColor1 = Colors.yellow;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 30.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            textColor1 = Colors.blue;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            textColor1 = Colors.green;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 30.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            textColor1 = Colors.orange;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
