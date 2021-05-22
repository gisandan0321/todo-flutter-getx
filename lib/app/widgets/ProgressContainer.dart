import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ProgressContainer extends StatelessWidget {

  const ProgressContainer({
    Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(top: 50, bottom: 50),
        padding: EdgeInsets.all(30),
        color: Colors.transparent,
        child: new CircularProgressIndicator(strokeWidth: 2,),
      ),
    );
  }
}