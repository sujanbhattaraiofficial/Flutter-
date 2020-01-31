import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());


class MyApp extends StatefulWidget {
//lets connect
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("pathDemo");

sendData()
{
  databaseReference.push().set({
    'first_Name': 'Sujan',
    'last_Name': 'Bhattarai'
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase App Demo"),
        ),
        body: Center(
          child: FlatButton(
            color: Colors.blue,
            onPressed: (){
              sendData();
            },
            child: Text("press to send data"),
          ),
        ),
      ),
      
    );
  }
}