import 'package:flutter/material.dart';
import '../data/data.dart';
import './aboutPage.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0.0),
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    "MS word shortcuts guide",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Aboutpage();
                }));
              },
              leading: Icon(Icons.info_outline),
              title: Text("About app"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.rate_review),
              title: Text("Rate Us"),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {
                Share.share("Hi dowmload this cool app, Thank You!");
              },
              leading: Icon(Icons.share),
              title: Text("Share"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Aboutpage();
              }));
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: Text("MS Word Shortcuts"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 2.0,
            color: Colors.white,
          );
        },
        itemCount: dataKeyWord.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.blueAccent,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(dataKeyWord[index]["key"]),
            subtitle: Text(dataKeyWord[index]["use"]),
          );
        },
      ),
    );
  }
}
