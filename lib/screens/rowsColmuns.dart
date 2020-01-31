import 'package:flutter/material.dart';

class RowsAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Row(
        //Column
        //spaceAround: aralarında boşluk bırakılabilir.
        //spaceBetween: ilk ve son eleman kenara yapışık şekilde aralara boşluk bırakılır
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: createSquare(5),
      ),
    );
  }
}

List<Widget> createSquare(int numSquare) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = List<Widget>();
  while (i < numSquare) {
    Container square = Container(
      color: colors[i],
      width: 60,
      height: 60,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }
  return squares;
}
