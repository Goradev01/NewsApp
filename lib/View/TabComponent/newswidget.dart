import 'package:flutter/material.dart';
import 'package:newapp/View/TabComponent/detail.dart';
import 'package:newapp/View/style.dart';

mixin NewsWidget on Ui {
  Widget bigSection(context, String title, String image, String author,
      String date, String content) {
    return GestureDetector(
      onTap: () {
        nav(
            context,
            DetailNews(
              content: content,
              date: date,
              image: image,
              title: title,
            ));
      },
      child: Container(
        height: 280,
        width: 250,
        alignment: center,
        margin: const EdgeInsets.only(right: 10),
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
                  image,
                  height: 150,
                  width: 250,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: pSymmetric(8, 0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14, color: black83),
              ),
            ),
            const Divider(),
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
                wspacer(10),
                Column(
                  crossAxisAlignment: cStart,
                  children: [
                    input(author, black83, w500, 14),
                    input(date, numb, w400, 12),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: numb.withOpacity(0.2), borderRadius: borderR(5)),
                  child: Icon(
                    Icons.share,
                    color: blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget searchSection(context, String title, String image, String author,
      String date, String content) {
    return GestureDetector(
      onTap: () {
        nav(
            context,
            DetailNews(
              content: content,
              date: date,
              image: image,
              title: title,
            ));
      },
      child: Container(
        height: 280,
        width: width(context),
        alignment: center,
        margin: const EdgeInsets.only(top: 10),
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
                  image,
                  height: 150,
                  width: width(context),
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: pSymmetric(8, 0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14, color: black83),
              ),
            ),
            const Divider(),
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
                wspacer(10),
                Column(
                  crossAxisAlignment: cStart,
                  children: [
                    input(author, black83, w500, 14),
                    input(date, numb, w400, 12),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget shortSection() {
    return Container(
      height: 85,
      width: 250,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 10, top: 10),
      decoration: BoxDecoration(color: white, borderRadius: borderR(12)),
      child: Row(children: [
        ClipRRect(
          borderRadius: borderR(12),
          child: Image.asset(
            'assets/onboard2.jpg',
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
        wspacer(10),
        Flexible(
          child: Column(
            crossAxisAlignment: cStart,
            children: [
              input('Six Trending ', black, w500, 15),
              hspacer(4),
              input('Trees in 2020', black, w500, 15),
              hspacer(10),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: black83,
                    size: 25,
                  ),
                  wspacer(7),
                  input('40,500', black83, w400, 12),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
