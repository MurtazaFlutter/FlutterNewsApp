import '../utils/exports.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<ArticleModel>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      debugPrint("news data ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> articles = jsonData['articles'];

        return articles
            .map((article) => ArticleModel.fromJson(article))
            .toList();
      } else {
        throw Exception("Failed to load news");
      }
    } on SocketException {
      throw Exception("Please check your internet connection");
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}
