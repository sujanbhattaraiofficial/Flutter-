import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    HomePage(),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          actions: <Widget>[
            Icon(Icons.search)
          ],
          title: Text("Home"),
        ),
        body: Container(
          color: Colors.green,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.battery_alert,
                  color: Colors.red,),
                  Icon(Icons.battery_full),
                ],
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blueAccent,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "i am a child",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Center(
                    child: Text("Iam also a child widget of container widget")),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("click Here"),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
