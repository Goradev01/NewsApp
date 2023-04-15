// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/Model/Core/newsdata.dart';
import 'package:newapp/Provider/authprovider.dart';
import 'package:newapp/Provider/newsprovider.dart';
import 'package:newapp/View/TabComponent/newswidget.dart';
import 'package:newapp/View/TabComponent/search.dart';
import 'package:newapp/View/style.dart';
import 'package:intl/intl.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> with Ui, NewsWidget {
  List dataT = [
    'Top Headline',
    'US Business',
    'TechCrunch',
    'Technology',
    'Science'
  ];

  List<NewData> newData = [];

  String formatDate(DateTime date) => DateFormat("d MMMM").format(date);
  @override
  Widget build(BuildContext context) {
    var name = ref.watch(authName);
    return innnerLayout2(Column(
      crossAxisAlignment: cStart,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: borderR(8), color: blue),
              width: 50,
              child: ClipRRect(
                borderRadius: borderR(8),
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
                input('Welcome $name', black, w700, 16),
                input(formatDate(DateTime.now()), black, w500, 12),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  ref.watch(firebaseAuthProvider).signOut();
                },
                child: input('Log Out', Colors.red, w500, 14)),
          ],
        ),
        Builder(
          builder: (context) {
            var data = ref.watch(newsFuture);

            return data.when(
                loading: () => const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(child: CircularProgressIndicator())),
                error: (error, stackTrace) => Text('Error: $error'),
                data: (data) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          nav(
                              context,
                              SearchPage(
                                data: data,
                              ));
                        },
                        child: Container(
                            width: width(context),
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 5),
                            height: 51,
                            padding: const EdgeInsets.only(left: 14),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: width(context) * 0.5,
                                    child: input(
                                        'Search for article', numb, w400, 14)),
                                Container(
                                  alignment: center,
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: blue,
                                    borderRadius: borderR(5),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataT.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: pSymmetric(10, 10),
                                child: input(dataT[index], grey, w500, 14),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 290,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var prop = data[index];
                            var date = prop.publishAt!;
                            DateTime dateTime = date == 'null'
                                ? DateTime.now()
                                : DateTime.parse(date);
                            return bigSection(
                                context,
                                prop.title!,
                                prop.image!,
                                prop.author!,
                                formatDate(dateTime),
                                prop.content!);
                          },
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
        Padding(
          padding: pSymmetric(10, 0),
          child: Row(
            children: [
              input('Short For You', black, w700, 16),
              const Spacer(),
              input('View All', numb, w500, 14),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return shortSection();
              }),
        )
      ],
    ));
  }
}
