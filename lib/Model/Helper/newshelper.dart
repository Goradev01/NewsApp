import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:newapp/Model/Core/newsdata.dart';
import 'package:newapp/Model/Service/newsapi.dart';

class NewsHelper {
  final api = NewsApi();

  Future<Either<Exception, Map>> getData() async {
    final apiResult = await api.getData();

    return apiResult.fold((l) => Left(l), (r) {
      final dataapi = jsonDecode(r.body)['articles'];
      List<NewData> data = List.generate(
          dataapi.length, (index) => NewData.fromJson(dataapi[index]));

      Map body = {
        'code': r.statusCode,
        'data': data,
      };
      return Right(body);
    });
  }
}
