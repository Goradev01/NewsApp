import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:newapp/Model/configure.dart';

class NewsApi {
  String endpoint = BaseUrl().base;

  Future<Either<Exception, http.Response>> getData() async {
    try {
      final res = await http.get(
        Uri.parse(endpoint),
      );

      return Right(res);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
