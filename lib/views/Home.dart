import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/widgets/EmptyText.dart';
import 'package:todoapp/app/widgets/ProgressContainer.dart';
import 'package:todoapp/controllers/HomeController.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:todoapp/views/AddTodo.dart';
import 'package:todoapp/views/EditTodo.dart';
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
      body: Obx(() => homeController.gettingItems.isTrue ? new ProgressContainer() : new ListView(
        children: [
          ...homeController.items
              .map(
                (todo) => new TodoItem(
              onItemView: (Todo todo) {
                Get.to(EditTodo(), arguments: todo);
              },
              todo: todo,
            ),
          ).toList()
        ])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodo());
        },
        tooltip: "Add To Do",
        child: Icon(Icons.add),
      ),
    );
  }

}