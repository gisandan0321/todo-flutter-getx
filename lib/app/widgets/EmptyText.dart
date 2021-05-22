import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';


class EmptyText extends StatelessWidget {

  final String message;

  const EmptyText({
    this.message,
    Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
          color: Colors.transparent,
          child: new Text(
            this.message ?? "Empty",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: Colors.grey
            ),
          )
      ),
    );
  }
}