import 'package:flutter/material.dart';
import 'package:newapp/Model/Core/newsdata.dart';
import 'package:newapp/View/TabComponent/newswidget.dart';
import 'package:intl/intl.dart';

import '../style.dart';

class SearchPage extends StatefulWidget {
  final List<NewData> data;
  const SearchPage({super.key, required this.data});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with Ui, NewsWidget {
  List<NewData> data = [];

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return innnerLayout2(Column(
      children: [
        Container(
            width: width(context),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            height: 51,
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width(context) * 0.5,
                  child: TextFormField(
                    initialValue: '',
                    onChanged: (val) {
                      setState(() {
                        if (val.isNotEmpty) {
                          String upperCase =
                              val[0].toUpperCase() + val.substring(1);
                          final dataSort = data
                              .where((element) =>
                                  element.title!.contains(upperCase))
                              .toList();
                          data = dataSort;
                        } else {
                          data = widget.data;
                        }
                      });
                    },
                    decoration: const InputDecoration.collapsed(
                      // labelText: 'Email address',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 12),
                      // errorText: validmail(email),
                      hintText: 'search for article',
                    ),
                  ),
                ),
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
        data.isNotEmpty
            ? Column(
                children: List.generate(data.length, (index) {
                  var prop = data[index];
                  var date = prop.publishAt!;
                  String formatDate(DateTime date) =>
                      DateFormat("d MMMM").format(date);
                  DateTime dateTime =
                      date == 'null' ? DateTime.now() : DateTime.parse(date);
                  return searchSection(context, prop.title!, prop.image!,
                      prop.author!, formatDate(dateTime), prop.content!);
                }),
              )
            : input('No result found', Colors.red, w500, 14)
      ],
    ));
  }
}
