import 'package:news_app/utils/exports.dart';

class ArticleModel extends ChangeNotifier {
  String? author;
  String? title;
  String? url;
  String? urlToImage;
  String? description;
  String? content;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.description});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        content: json['content'] ?? '',
        description: json['description'] ?? '');
  }
}
