import 'package:flutter/material.dart';
import 'package:todo_app/screens/Navigation/art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  ArtRoute({@required this.art});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Choose your art',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage('http://bit.ly/fl_sky'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              title: Text(ArtUtil.CARAVAGGIO),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
              trailing: Icon(Icons.access_alarm),
            ),
            ListTile(
              title: Text(ArtUtil.MONET),
              onTap: () => changeRoute(context, ArtUtil.MONET),
              trailing: Icon(Icons.accessibility),
            ),
            ListTile(
              title: Text(ArtUtil.VANGOGH),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
              trailing: Icon(Icons.all_inclusive),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Navigation art"),
        actions: <Widget>[
          PopupMenuButton(
            //icon: Icon(Icons.ac_unit),
            // child: Text("Change Route"),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem(child: Text(item), value: item);
              }).toList();
            },
            onSelected: (value) => changeRoute(context, value),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(art), fit: BoxFit.cover)),
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        image = ArtUtil.IMG_CARAVAGGIO;
        break;
      case ArtUtil.MONET:
        image = ArtUtil.IMG_MONET;
        break;
      case ArtUtil.VANGOGH:
        image = ArtUtil.IMG_VANGOGH;
        break;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtRoute(art: image)));
  }
}
