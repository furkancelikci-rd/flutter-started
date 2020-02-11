import 'package:flutter/material.dart';
import 'package:todo_app/screens/animation/util.dart';

class Details extends StatelessWidget {
  final String drinkPath;
  final String drinkTag;
  Details(this.drinkPath, this.drinkTag);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animasyon"),
      ),
      body: Center(
        child: Util.buildHeroDestination(drinkPath, drinkTag, width),
      ),
    );
  }
}
