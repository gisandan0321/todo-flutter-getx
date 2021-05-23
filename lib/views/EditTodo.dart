import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/components/InputField.dart';
import 'package:todoapp/app/constants/Labels.dart';
import 'package:todoapp/controllers/EditTodoController.dart';

class EditTodo extends StatelessWidget {
  final EditTodoController editTodoController = Get.put(EditTodoController());

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {

    editTodoController.titleController.text = Get.arguments.title;
    editTodoController.descriptionController.text = Get.arguments.description;
    editTodoController.todoId = Get.arguments.id;

    return new Scaffold(
      appBar: AppBar(
        title: new Text(Get.arguments.title),
        actions: [
          new IconButton(
              icon: new Icon(Icons.check),
              onPressed: () {
                editTodoController.edit();
              }
          ),
          new IconButton(
              icon: new Icon(Icons.delete),
              onPressed: () {
                editTodoController.deleteTodo();
                Get.back();
              }
          )
        ],
      ),
      body: new ListView(
        padding: EdgeInsets.all(20),
        children: [
          new InputField(
            label: Labels.TITLE,
            lines: 1,
            height: 40,
            inputType: TextInputType.text,
            controller: editTodoController.titleController,
            autoFocus: true,
          ),
          new SizedBox(height: 20),
          new InputField(
            label: Labels.DESCRIPTION,
            lines: 1,
            height: 40,
            inputType: TextInputType.text,
            controller: editTodoController.descriptionController,
            autoFocus: true,
          ),
        ],
      ),
    );
  }
}