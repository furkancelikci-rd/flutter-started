import 'package:flutter/material.dart';

class GesAnim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GesAnimState();
}

class _GesAnimState extends State<GesAnim> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPress = 0;
  double posX = 0.0;
  double posY = 0.0;
  double boxSize = 0.0;
  final double fullboxSize = 150.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation.addListener(() {
      setState(() {
        boxSize = fullboxSize * animation.value;
      });
      center(context);
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0.0) {
      center(context);
    }
    return Scaffold(
      //appBar: AppBar(
      //  title: Text("Hareket ve Animasyon"),
      //),
      body: GestureDetector(
          onTap: () {
            setState(() {
              numTaps++;
            });
          },
          onDoubleTap: () {
            setState(() {
              numDoubleTaps++;
            });
          },
          onLongPress: () {
            setState(() {
              numLongPress++;
            });
          },
          onVerticalDragUpdate: (DragUpdateDetails value) {
            setState(() {
              posY += value.delta.dy;
            });
          },
          onHorizontalDragUpdate: (DragUpdateDetails value) {
            setState(() {
              posX += value.delta.dx;
            });
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                left: posX,
                top: posY,
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              )
            ],
          )),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Taps: $numTaps - Double Taps: $numDoubleTaps - Long Presses: $numLongPress",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30.0;
    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
