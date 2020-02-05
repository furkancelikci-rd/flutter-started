import 'package:flutter/material.dart';
import 'package:todo_app/screens/Navigation/art_route.dart';
import 'package:todo_app/screens/Navigation/art_util.dart';
import 'package:todo_app/screens/basicLayout.dart';
import 'package:todo_app/screens/gesanim.dart';
import 'package:todo_app/screens/rowsColmuns.dart';
import 'package:todo_app/screens/todolist.dart';
import 'package:todo_app/utils/dbhelper.dart';
import 'package:todo_app/model/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Color(0xffccff90)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ArtRoute(art: ArtUtil.IMG_VANGOGH,),
    );
  }
}
