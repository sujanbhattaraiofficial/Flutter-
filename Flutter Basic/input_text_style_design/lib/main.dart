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
      title: "Input Text Design",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Design Input Text Field"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Center(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.yellowAccent,
                  filled: false,
                  focusColor: Colors.red,
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  labelText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                   // borderSide: BorderSide(color: Colors.purpleAccent)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          color: Colors
                              .green)), //when your cursor focus on textfield
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
