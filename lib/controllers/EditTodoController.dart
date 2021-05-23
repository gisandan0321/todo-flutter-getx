import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/constants/ResponseMessage.dart';
import 'package:todoapp/app/constants/Status.dart';
import 'package:todoapp/app/database/QueryBuilder.dart';
import 'package:todoapp/app/widgets/Toaster.dart';
import 'package:todoapp/controllers/HomeController.dart';
import 'package:todoapp/models/Todo.dart';

class EditTodoController extends GetxController {
  final titleController = new TextEditingController();
  final descriptionController = new TextEditingController();
  var todoId = 0;
  final homeController = Get.find<HomeController>();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void edit() async {
    isLoading(true);

    var database = await QueryBuilder().initDatabase();

    Todo todo = new Todo(
        id: todoId,
        title: titleController.text,
        description: descriptionController.text,
        status: Status.PENDING
    );

    var result = await todo.update(database);
    isLoading(false);

    if (result > 0) {
      Toaster.normal(ResponseMessage.SUCCESS_EDIT_TODO);
      for (int i = 0; i < homeController.items.length; i++) {
        if (homeController.items[i].id == todoId) {
          print("Matched");
          homeController.items[i] = todo;
          break;
        }
      }
      Get.back();
    } else {
      Toaster.error(ResponseMessage.ERROR_EDIT_TODO);
    }
  }

  void deleteTodo() async {

  }
}