import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todoapp/app/constants/Status.dart';
import 'package:todoapp/app/constants/ResponseMessage.dart';
import 'package:todoapp/app/database/QueryBuilder.dart';
import 'package:todoapp/app/widgets/Toaster.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/Home.dart';

class AddTodoController extends GetxController {
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void add() async {
    isLoading(true);

    var database = await QueryBuilder().initDatabase();

    Todo todo = new Todo(
        title: titleController.text,
        description: descriptionController.text,
        status: Status.PENDING
    );

    var result = await todo.insert(database);
    isLoading(false);

    todo.id = result;
    if (result > 0) {
      Toaster.normal(ResponseMessage.SUCCESS_ADD_TODO);
      Get.back();
    } else {
      Toaster.error(ResponseMessage.ERROR_ADD_TODO);
    }
  }
}