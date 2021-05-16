import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/components/InputField.dart';
import 'package:todoapp/app/constants/Labels.dart';
import 'package:todoapp/controllers/AddTodoController.dart';

class AddTodo extends StatelessWidget {
  final AddTodoController addTodoController = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Add ToDo"),
        actions: [
          new IconButton(
              icon: new Icon(Icons.check),
              onPressed: () {
                addTodoController.add();
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
            controller: addTodoController.titleController,
            autoFocus: true,
          ),
          new SizedBox(height: 20),
          new InputField(
            label: Labels.DESCRIPTION,
            lines: 1,
            height: 40,
            inputType: TextInputType.text,
            controller: addTodoController.descriptionController,
            autoFocus: true,
          ),
        ],
      ),
    );
  }
}