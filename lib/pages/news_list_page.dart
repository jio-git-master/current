import 'package:flutter/material.dart';
import 'package:current/news_api_service.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final NewsApiService _newsApiService = NewsApiService();
  List<NewsArticle>? _newsArticles;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    final newsArticles = await _newsApiService.getNews();
    setState(() {
      _newsArticles = newsArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent'),
      ),
      body: _newsArticles == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _newsArticles!.length,
        itemBuilder: (context, index) {
          final article = _newsArticles![index];

          return ListTile(
            title: Text(
              article.title ?? 'No Title Available', // Use null-aware operator for safety
              style: const TextStyle(
                fontSize: 16.0,          // Font size
                fontWeight: FontWeight.bold, // Make it bold
                color: Colors.deepPurple, // Change text color
                fontFamily: 'Roboto',    // Specify a font family (optional)
                letterSpacing: 0.5,      // Space between letters
                height: 1.2,             // Line height
                // You can add more properties here:
                // fontStyle: FontStyle.italic,
                // decoration: TextDecoration.underline,
                // decorationColor: Colors.red,
                // decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            subtitle: Text(
              article.description ?? 'No description available.', // Use null-aware operator for safety
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}