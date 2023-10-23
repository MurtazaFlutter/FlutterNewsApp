import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/articel_model.dart';
import 'package:news_app/utils/utils.dart';

class NewsService {
  Future<List<ArticleModel>> fetchNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> articles = jsonData['articles'];

      return articles.map((article) => ArticleModel.fromJson(article)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
