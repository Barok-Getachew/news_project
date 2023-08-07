import 'package:flutter/material.dart';

import 'package:news_project/Widgets/NewsCard.dart';

import 'package:provider/provider.dart';

import '../providers/NewsProvider.dart';

class NewsList extends StatefulWidget {
  static const routename = 'News-list';

  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  bool _isDataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      final category = ModalRoute.of(context)!.settings.arguments as String?;
      Provider.of<Article>(context, listen: false).getNews(category!);
      _isDataFetched = true;
    }
    print(_isDataFetched);
  }

  @override
  Widget build(BuildContext context) {
    final fetchedNews = Provider.of<Article>(context).Newss;

    return Scaffold(
      appBar: AppBar(
          // ... Your app bar code ...
          ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return NewsCards(title: fetchedNews[index].title!);
        },
        itemCount: fetchedNews.length,
      ),
    );
  }
}
