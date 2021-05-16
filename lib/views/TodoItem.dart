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
    return new Container(
      padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
        Border(top: BorderSide(color: Color.fromARGB(255, 209, 213, 218))),
      ),
      child: new ListTile(
        title: todo.statusText == Status.DONE ? new Text(todo.title,
          style: TextStyle(
            decoration: TextDecoration.lineThrough
          ),
        ) : new Text(todo.title),
        subtitle: new Text(todo.description),
        onTap: () {
          onItemView(todo);
        },
      ),
    );
  }
}

typedef ViewCallBack = void Function(Todo todo);