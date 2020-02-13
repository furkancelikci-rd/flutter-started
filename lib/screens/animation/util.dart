import 'package:flutter/material.dart';
import 'package:todo_app/screens/animation/radial.dart';

class Util {
  static const String COFFEE_URL = "http://bit.ly/fl_coffee";
  static const String CAPPUCCINO_URL = "http://bit.ly/fl_cappuccino";
  static const String TEA_URL = "http://bit.ly/fl_tea";

  static Widget buildHeroIcon(String path, String tag) {
    return Hero(
      tag: tag,
      child: Container(
        width: 80,
        height: 80,
        child: Image.network(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget buildHeroDestination(String path, String tag, double width) {
    return Hero(
        tag: tag,
        child: Container(
          width: width,
          child: Image.network(path, fit: BoxFit.cover),
        ));
  }

  static Widget buildHeroRadialIcon(
      String path, String tag, double minRadius, double maxRadius) {
    return Container(
      child: Hero(
        tag: tag,
        //createRectTween: createTween,
        child: Container(
          height: minRadius,
          width: minRadius,
          child: RadialTransition(
            maxRadius: maxRadius,
            child: Image.network(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildHeroRadialDestination(
      String path, String tag, double maxWidth, double maxRHeight, VoidCallback pop) {
    return GestureDetector(
      child: Hero(
        createRectTween: _createTween,
        tag: tag,
        child: Container(
          height: maxRHeight,
          width: maxWidth,
          child: RadialTransition(
            maxRadius: maxWidth / 2,
            child: Image.network(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: pop,
    );
  }

  static RectTween _createTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}
