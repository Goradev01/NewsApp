import 'package:flutter/material.dart';
import 'package:newapp/View/style.dart';

class DetailNews extends StatefulWidget {
  final String image;
  final String title;
  final String content;
  final String date;
  const DetailNews(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      required this.date});

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> with Ui {
  @override
  Widget build(BuildContext context) {
    return innnerLayout(Column(
      children: [
        Row(
          mainAxisAlignment: mBtw,
          children: [
            GestureDetector(
              onTap: () {
                popBack(context);
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: center,
                decoration: BoxDecoration(
                    borderRadius: borderR(12), color: numb.withOpacity(0.3)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: black,
                  size: 15,
                ),
              ),
            ),
            input('Detail', black, w700, 20),
            Container(
              width: 40,
              height: 40,
              alignment: center,
              decoration: BoxDecoration(
                  borderRadius: borderR(12), color: numb.withOpacity(0.3)),
              child: Icon(
                Icons.menu,
                color: black,
                size: 15,
              ),
            ),
          ],
        ),
        Container(
          width: width(context),
          alignment: center,
          decoration: BoxDecoration(
            color: white,
            borderRadius: borderR(12),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              ClipRRect(
                  borderRadius: borderR(12),
                  child: Image.network(
                    widget.image,
                    width: width(context),
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: pSymmetric(15, 0),
                child: input('#Health', blue, w700, 14),
              ),
              Padding(
                padding: pSymmetric(8, 0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: black),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: pSymmetric(15, 0),
          decoration: BoxDecoration(color: white),
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration:
                        BoxDecoration(color: blue, borderRadius: borderR(20)),
                    child: ClipRRect(
                      borderRadius: borderR(20),
                      child: Image.asset(
                        'assets/man.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  input(widget.date, numb, w400, 12),
                ],
              ),
              input(widget.content, numb, w500, 14),
            ],
          ),
        )
      ],
    ));
  }
}
