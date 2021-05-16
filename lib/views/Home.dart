import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/HomeController.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:todoapp/views/TodoItem.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

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
          ...homeController.items
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