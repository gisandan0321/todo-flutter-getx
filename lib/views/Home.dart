
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:todoapp/views/TodoItem.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  List<Todo> items = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("ToDo App"),
        elevation: 2,
      ),
      body: new ListView(
        padding: EdgeInsets.all(20),
        children: [
          ...items
              .map(
                (todo) => new TodoItem(
              onItemView: null,
              todo: todo,
            ),
          ).toList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add-todo");
        },
        tooltip: "Add To Do",
        child: Icon(Icons.add),
      ),
    );
  }

}