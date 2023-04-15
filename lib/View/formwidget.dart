import 'package:flutter/material.dart';
import 'package:newapp/View/style.dart';

class FormWidget with Ui {
  String? inputText;
  String? text;
  BuildContext? context;
  TextInputType? keyboard;
  String? hint;
  Widget? suffix;

  FormWidget({
    required this.inputText,
    required this.text,
    required this.context,
  });

  Widget inputName() {
    return input(text!, black, w500, 14);
  }

  Widget textField() {
    return Padding(
      padding: pSymmetric(10, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          inputName(),
          hspacer(5),
          Container(
            width: width(context),
            height: 48,
            alignment: left,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: borderR(8),
                border: Border.all(
                  color: numb,
                  width: 1,
                )),
            child: TextField(
              onChanged: (val) {
                inputText = val;
              },
              keyboardType: keyboard ?? TextInputType.name,
              decoration: InputDecoration.collapsed(
                hintText: hint ?? " ",
                // suffix: Icon(Icons.remove_red_eye),
                // labelText: 'Email address',
                border: InputBorder.none,

                // errorText: validmail(email),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
