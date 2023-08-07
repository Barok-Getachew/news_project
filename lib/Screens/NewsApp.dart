import 'package:flutter/material.dart';
import 'package:news_project/Widgets/News-Drawer.dart';
import 'package:news_project/Widgets/TopicsList.dart';
import 'package:news_project/Widgets/search.dart';
import '../providers/category_provider.dart';

class NewsApp extends StatelessWidget {
  static const routename = 'News-App';

  final VoidCallback brightness;
  const NewsApp(this.brightness, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover News',
          textAlign: TextAlign.center,
        ),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        titleSpacing: 10,
        actions: [
          IconButton(
              alignment: Alignment.center,
              onPressed: () =>
                  showSearch(context: context, delegate: mySearch()),
              icon: const Icon(
                Icons.search,
                size: 25,
              ))
        ],
      ),
      drawer: NewsDrawer(brightness),
      body: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return TopicsList(
                  CategoryName: category[index].categoryName,
                  imageUrl: category[index].imageUrl);
            }),
            itemCount: category.length,
          )),
    );
  }
}
