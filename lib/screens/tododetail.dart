import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/utils/dbhelper.dart';
import 'package:intl/intl.dart';

DbHelper helper = DbHelper();

final List<String> choices = const <String>[
  'Kaydet & Geri',
  'Sil',
  'Listeye Dön'
];

const mnuSave = 'Kaydet & Geri';
const mnuDelete = 'Sil';
const mnuBack = 'Listeye Dön';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State {
  Todo todo;
  TodoDetailState(this.todo);
  final _priorities = ['High', 'Medium', 'Low'];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(todo.title),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Başlık",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
                    child: TextField(
                      controller: descController,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: "Açıklama",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                DropdownButton<String>(
                    style: textStyle,
                    value: _priority,
                    elevation: 16,
                    onChanged: null,
                    items: <String>['High', 'Medium', 'Low']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList())
              ],
            )));
  }


}
