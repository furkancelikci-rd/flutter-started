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
      body: Container(
        margin: EdgeInsets.all(50.0),
        width: 100.0,
        height: 100.0,
        // color: Colors.purple, //-decoration prop before
        decoration: BoxDecoration(
            color: Colors.purple,
            gradient: LinearGradient(
                //begin: Alignment.topCenter,
                //end: Alignment.bottomCenter,
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [Colors.orange[50], Colors.orange[500]]),
            image: DecorationImage(
                image: NetworkImage('http://bit.ly/flutter_tiger'),
                fit: BoxFit.cover,
                // repeat: ImageRepeat.repeatX
                ),
            // shape: BoxShape.circle
            shape: BoxShape.rectangle,
            //borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
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
