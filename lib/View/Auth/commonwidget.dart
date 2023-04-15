import 'package:flutter/material.dart';
import 'package:newapp/View/style.dart';

mixin CommonAuthWidget on Ui {
  Widget header(String text) {
    return Row(
      children: [
        input(text, black, w500, 20),
        const Spacer(),
        Container(
          height: 30,
          width: 30,
          alignment: center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: numb)),
          child: const Icon(
            Icons.close,
          ),
        )
      ],
    );
  }

  Widget oAuthButton(context, String text) {
    return Container(
        height: 45,
        margin: pSymmetric(15, 0),
        width: width(context),
        alignment: center,
        decoration: BoxDecoration(
            borderRadius: borderR(10),
            border: Border.all(width: 1, color: numb)),
        child: commonText(text, black));
  }
}
