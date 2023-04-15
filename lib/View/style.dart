import 'package:flutter/material.dart';

class Ui {
  Color black = const Color(0xff000000);
  Color white = const Color(0xffffffff);
  Color blue = const Color(0xff5474FF);
  Color numb = const Color(0xffA9A9BC);
  Color black83 = const Color(0xff857A83);
  Color bg = const Color(0xffFBF3F9);
  Color grey = Colors.blueGrey;
  FontWeight w400 = FontWeight.w400;
  FontWeight w500 = FontWeight.w500;
  FontWeight w700 = FontWeight.w700;
  MainAxisAlignment mBtw = MainAxisAlignment.spaceBetween;
  CrossAxisAlignment cStart = CrossAxisAlignment.start;
  Alignment center = Alignment.center;
  Alignment left = Alignment.centerLeft;
  Alignment topLeft = Alignment.topLeft;
  Alignment topRight = Alignment.topRight;
  Alignment right = Alignment.centerRight;
  Widget commonText(String text, Color color) => input(text, color, w500, 14);
  Widget input(String text, Color color, FontWeight weight, double size) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: weight, fontSize: size),
    );
  }

  Widget hspacer(double num) {
    return SizedBox(height: num);
  }

  Widget wspacer(double num) {
    return SizedBox(width: num);
  }

  void errorAlert(donefunct, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(donefunct),
            actions: [
              TextButton(
                  onPressed: () {
                    //DeleteProduct(Image, Category, Id)

                    Navigator.pop(context);
                  },
                  child: const Text('back')),
            ],
          );
        });
  }

  Widget loadingCircular() {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }

  Widget innnerLayout(Widget body) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: body,
          ),
        ),
      ),
    );
  }

  Widget innnerLayout2(Widget body) {
    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: body,
          ),
        ),
      ),
    );
  }

  Widget button(Widget text, Color color) {
    return Container(
      height: 48,
      padding: pSymmetric(10, 20),
      alignment: center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: text,
    );
  }

  double width(context) {
    return MediaQuery.of(context).size.width;
  }

  double height(context) {
    return MediaQuery.of(context).size.height - 65;
  }

  Future nav(BuildContext context, Widget widget) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  Widget inputCenter(color, double size, text, weight) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decorationColor: color,
        ));
  }

  EdgeInsets pSymmetric(double v, double h) {
    return EdgeInsets.symmetric(vertical: v, horizontal: h);
  }

  Future navW(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  void popBack(context) {
    return Navigator.of(context).pop();
  }

  BorderRadius borderR(double r) => BorderRadius.circular(r);
  BorderRadius borderUpper(double r) =>
      BorderRadius.vertical(top: Radius.circular(r));
}
