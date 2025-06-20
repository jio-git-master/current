import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String image;

  NewsArticle({required this.title, required this.description, required this.url, required this.image});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class NewsApiService {
  final String _apiKey = '88fd537345735f993a631e63d8291a0f';
  final String _baseUrl = 'https://api.mediastack.com/v1/news';

  Future<List<NewsArticle>> getNews() async {
    final response = await http.get(Uri.parse('$_baseUrl?access_key=$_apiKey'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final articles = jsonData['data'];

      return articles.map<NewsArticle>((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}