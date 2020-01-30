import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme Üst Başlık"),
      ),
      body: Center(
        child: Text("Orta Alan"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.outlined_flag),
        onPressed: () {
          print("action button tıklandı");
        },
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          icon: Icon(Icons.comment),
          onPressed: () {
            print("comment");
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            print("shared");
          },
        )
      ],
    );
  }
}
