import 'package:flutter/material.dart';
import 'package:todoapp/app/constants/Status.dart';
import 'package:todoapp/models/Todo.dart';

class TodoItem extends StatelessWidget {
  final ViewCallBack onItemView;
  final Todo todo;

  const TodoItem({this.onItemView,
    this.todo,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Checkbox(
        value: todo.status == Status.DONE,
        onChanged: (bool newValue) {
          // onChanged(newValue);
        },
      ),
      title: new Text(todo.title),
      subtitle: new Text(todo.description),
      onTap: () {
        onItemView(todo);
      },
    );
  }
}

typedef ViewCallBack = void Function(Todo todo);