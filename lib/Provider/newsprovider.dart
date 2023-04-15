import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/Model/Core/newsdata.dart';
import 'package:newapp/Model/Helper/newshelper.dart';

final helper = NewsHelper();
final newsFuture = FutureProvider.autoDispose<List<NewData>>((ref) async {
  List<NewData> data = [];
  int code = 404;
  while (code == 404) {
    await helper.getData().then((value) => value.fold((l) => null, (r) async {
          code = r['code'];
          data = r['data'];
        }));
  }

  return data;
});

class NewProvider extends ChangeNotifier {
  Future<List<NewData>> getData() async {
    List<NewData> data = [];
    int code = 404;
    while (code == 404) {
      await helper.getData().then((value) => value.fold((l) => null, (r) async {
            code = r['code'];
            data = r['data'];
          }));
    }

    return data;
  }
}
