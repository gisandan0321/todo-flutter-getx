import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app/constants/AppColors.dart';

class InputField extends StatelessWidget {
  final String label;
  final int lines;
  final double height;
  final TextInputType inputType;
  final TextEditingController controller;
  final OnChangeCallBack onChange;
  final OnSubmittedCallBack onSubmitted;
  final bool autoFocus;
  final bool isLongText;

  const InputField(
      {this.label,
        this.lines,
        this.height,
        this.onChange,
        this.onSubmitted,
        this.isLongText,
        this.inputType,
        @required this.controller,
        this.autoFocus,
        Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      child: new TextField(
          keyboardType: this.inputType,
          autofocus: this.autoFocus,
          style: TextStyle(color: Colors.black, fontSize: 14),
          controller: this.controller,
          onChanged: this.onChange,
          onSubmitted: this.onSubmitted,
          maxLines: this.lines,
          decoration: InputDecoration(
            labelText: this.label,
            labelStyle: TextStyle(color: AppColors.BLUE),
            focusColor: Colors.black,
            contentPadding: EdgeInsets.only(
                top: isLongText == true ? 20 : 5,
                bottom: 5,
                left: 15,
                right: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.BLUE),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          cursorColor: AppColors.BLUE),
    );
  }
}

typedef OnChangeCallBack = void Function(String value);
typedef OnSubmittedCallBack = void Function(String value);
