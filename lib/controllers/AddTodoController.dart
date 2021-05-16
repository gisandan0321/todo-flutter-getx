import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todoapp/app/constants/Status.dart';
import 'package:todoapp/app/database/QueryBuilder.dart';
import 'package:todoapp/models/Todo.dart';

class AddTodoController extends GetxController {
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void add() async {
    print(titleController.text);
    print(descriptionController.text);

    var database = await QueryBuilder().initDatabase();

    Todo todo = new Todo(
        title: titleController.text,
        description: descriptionController.text,
        status: Status.PENDING
    );

    var result = todo.insert(database);
    print(result);
  }
}