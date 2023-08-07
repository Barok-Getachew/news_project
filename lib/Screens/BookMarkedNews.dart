import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/NewsCard.dart';
import '../providers/NewsProvider.dart';

class Bookmarked extends StatefulWidget {
  static const routename = 'bookmarkded';
  const Bookmarked({super.key});

  @override
  State<Bookmarked> createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> {
  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<Article>(context).bookmarked;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BookMarked',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          titleSpacing: 30,
          actions: [
            IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ))
          ],
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return NewsCards(
              title: bookmark[index].title!,
            );
            // imageUrl: bookmark[index].urlImage!);
          }),
          itemCount: bookmark.length,
        ));
  }
}
