import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/AddTodoController.dart';

class EditTodo extends StatelessWidget {
  final AddTodoController editTodoController = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Edit ToDo"),
      ),
      body: new ListView(
        padding: EdgeInsets.all(20),
        children: [
          new Text("Dan Walker")
        ],
      ),
    );
  }
}