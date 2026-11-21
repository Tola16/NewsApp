import 'package:dio/dio.dart';
import 'package:newsapp/models/article.dart';

class ArticlesService {
  static Dio dio = Dio();
  static Future<Articles> fetchData() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Articles.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("Other error: ${other.toString()}");
    }
  }
}
