import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/AddTodo.dart';
import 'package:todoapp/views/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    title: 'ToDo App',
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    defaultTransition: Transition.rightToLeft,
    getPages: [
      GetPage(name: "/", page: () => Home()),
      GetPage(name: "/add-todo", page: () => AddTodo()),
      // GetPage(name: "/edit-todo", page: () => EditTodo()),
    ],
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new Home(),
  ));
}
