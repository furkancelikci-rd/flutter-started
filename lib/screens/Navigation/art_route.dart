import 'package:flutter/material.dart';
import 'package:todo_app/screens/Navigation/art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  ArtRoute({@required this.art});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
