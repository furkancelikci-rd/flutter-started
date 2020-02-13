import 'package:flutter/material.dart';
import 'package:todo_app/screens/animation/detail.dart';
import 'package:todo_app/screens/animation/util.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double maxRadius = MediaQuery.of(context).size.width;
    final double minRadius = 80.0;

    return Container(
      padding: EdgeInsets.all(24),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Util.buildHeroRadialIcon(
                Util.COFFEE_URL, 'coffee', minRadius, maxRadius),
            onTap: () {
              changeRoute(context, 'coffee');
            },
          ),
          GestureDetector(
            child: Util.buildHeroRadialIcon(
                Util.CAPPUCCINO_URL, 'cappuccino', minRadius, maxRadius),
            onTap: () {
              changeRoute(context, 'cappuccino');
            },
          ),
          GestureDetector(
            child: Util.buildHeroRadialIcon(
                Util.TEA_URL, 'tea', minRadius, maxRadius),
            onTap: () {
              changeRoute(context, 'tea');
            },
          ),
        ],
      ),
    );
  }

  void changeRoute(BuildContext context, String drink) {
    switch (drink) {
      case 'coffee':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.COFFEE_URL, drink)));
        break;
      case 'cappuccino':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.CAPPUCCINO_URL, drink)));
        break;
      case 'tea':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.TEA_URL, drink)));
        break;
      default:
    }
  }
}
