import 'package:flutter/material.dart';

class ProgressDialog {

  static spin(context, message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              content: new Row(
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: new Text(message),
                  )
                ],
              )
          );
        });
  }

  static stop(context) {
    Navigator.of(context).pop();
  }
}