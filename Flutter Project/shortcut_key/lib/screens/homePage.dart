import 'package:flutter/material.dart';
import '../data/data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MS Word Shortcuts"),
      ),
      body: ListView.separated(
        separatorBuilder: (context , index)
        {
          return Divider(color: Colors.white,);
        },
        itemCount: dataKeyWord.length,
        itemBuilder: (context, index){
          return  ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.blueAccent,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                    color: Colors.black,
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
