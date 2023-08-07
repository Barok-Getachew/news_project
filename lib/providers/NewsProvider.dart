import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_project/models/News.dart';

class Article with ChangeNotifier {
  List<News> _news = [];
  List<News> _bookmarked = [];

  List<News> get bookmarked {
    return [..._bookmarked];
  }

  List<News> get Newss {
    return [..._news];
  }

  void favorite(String title) {
    final bookmarkedNews =
        _news.firstWhere((element) => element.title == title);
    _bookmarked.insert(0, bookmarkedNews);
    notifyListeners();
  }

  Future<void> getNews(String category) async {
    final url =
        "http://newsapi.org/v2/top-headlines/sources?category=${category}&apiKey=b04d99e6ad194f9f817363f6d491cac8";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonData);
      jsonData['sources'].forEach((element) {
        if (element['urlToImage'] != null || element['description'] != null) {
          final news = News(
            title: element['name'],
            description: element['description'],
            url: element['url'],
            urlImage: element['urlToImage'],
          );
          _news.add(news);
        }
      });
      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }

  void delete(String title) {
    _bookmarked.removeWhere((element) => element.title == title);
    notifyListeners();
  }
}
