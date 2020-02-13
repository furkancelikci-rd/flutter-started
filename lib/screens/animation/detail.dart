import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_app/screens/animation/util.dart';

class Details extends StatelessWidget {
  final String drinkPath;
  final String drinkTag;
  Details(this.drinkPath, this.drinkTag);
  @override
  Widget build(BuildContext context) {
    pop() {
      Navigator.of(context).pop();
    }

    timeDilation = 10;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animasyon"),
      ),
      body: Center(
        child: Util.buildHeroRadialDestination(drinkPath, drinkTag, width, height, pop)
      ),
    );
  }
}
