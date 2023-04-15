import 'package:flutter/material.dart';
import 'package:newapp/View/TabComponent/news.dart';
import 'package:newapp/View/style.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with Ui {
  int tabNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: tabNo,
        children: const [
          NewsScreen(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 2,
          color: const Color(0xffffffff),
          child: SizedBox(
              height: 65,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tabNo = 0;
                          });
                        },
                        child: Icon(Icons.home_filled,
                            color: tabNo == 0 ? blue : numb)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tabNo = 1;
                          });
                        },
                        child: Icon(Icons.bookmark,
                            color: tabNo == 1 ? blue : numb)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tabNo = 2;
                          });
                        },
                        child: Icon(Icons.notifications,
                            color: tabNo == 2 ? blue : numb)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            tabNo = 3;
                          });
                        },
                        child: Icon(Icons.account_circle,
                            color: tabNo == 3 ? blue : numb)),
                  ]))),
    );
  }
}
