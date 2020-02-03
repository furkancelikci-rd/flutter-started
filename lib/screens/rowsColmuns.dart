import 'package:flutter/material.dart';

class RowsAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
        width: sizeX,
        height: sizeY,
        child: GridView.count(
          scrollDirection: Axis.horizontal, // scroolbar left -> right
          crossAxisCount: 3,
          children: createSquare(50),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: EdgeInsets.all(5),
        ));
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
      color: colors[i % 5],
      width: 60,
      height: 60,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }
  return squares;
}

Widget createList(int position) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  Container square = Container(
    color: colors[position % 5],
    width: 100.0,
    height: 100.0,
    child: Text(position.toString()),
  );
  return square;
}

Widget createSeperated(int position) {
  Widget separator = Container(
    height: 15,
    color: Colors.black,
  );
  return separator;
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = List<Widget>();
  Container backGround = Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("http://bit.ly/pizza_image"),
            fit: BoxFit.fitHeight)),
  );
  layoutChildren.add(backGround);
  Positioned pizzaCard = Positioned(
    top: sizeY / 20,
    left: sizeX / 40,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          Text(
            "Pizza Margherita",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800]),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
                "This delicious pizza is made of Tomato,\n Mozzorella and Basil. \n\n Seriously you can\'t miss it",
                style: TextStyle(fontSize: 18, color: Colors.grey[800])),
          )
        ],
      ),
    ),
  );
  layoutChildren.add(pizzaCard);
  Positioned buttonOrer = Positioned(
    bottom: sizeY / 20,
    left: sizeX / 20,
    width: sizeX - sizeX / 10,
    child: RaisedButton(
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.orange[900],
      child: Text(
        "Order Now!",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    ),
  );
  layoutChildren.add(buttonOrer);

  return layoutChildren;
}

List<Contact> buildContacts() {
  List<Contact> contacts = List<Contact>();
  contacts.add(
      Contact('Furkan ÇELİKCİ', 'Software Developer', Icons.sentiment_neutral));
  contacts.add(Contact(
      'Elif ÇELİKCİ', 'Front-End Developer', Icons.sentiment_satisfied));
  contacts.add(Contact(
      'Murat ÖNER', 'FullStack Developer', Icons.sentiment_dissatisfied));
  contacts.add(Contact(
      'Yusuf DAŞKIN', 'BackEnd Developer', Icons.sentiment_dissatisfied));
  return contacts;
}

List<ListTile> showContacts() {
  List<Contact> contacts = buildContacts();
  for (int i = 0; i < 20; i++) {
    contacts.addAll(buildContacts());
  }
  List<ListTile> list = List<ListTile>();
  contacts.forEach((contact) {
    list.add(ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.subtitle),
      leading: CircleAvatar(
        child: Icon(contact.icon),
        backgroundColor: Colors.amber[600],
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => true,
    ));
  });
  return list;
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}
