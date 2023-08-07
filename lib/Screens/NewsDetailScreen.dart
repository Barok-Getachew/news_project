import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_project/providers/NewsProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_share/flutter_share.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routename = 'news-detail';

  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;

    return Consumer<Article>(
      builder: (context, article, _) {
        final detail =
            article.Newss.firstWhere((element) => title == element.title);
        final isBookmarked = article.bookmarked.contains(detail);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail News'),
            actions: [
              IconButton(
                onPressed: () => article.favorite(title),
                icon:
                    Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
              ),
              IconButton(
                onPressed: () {
                  FlutterShare.share(title: detail.title!, linkUrl: detail.url);
                },
                icon: const Icon(Icons.share),
              )
            ],
          ),
          body: Hero(
            tag: detail.title!,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    detail.title!,
                    style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Container(
                //   height: 200,
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage(detail.urlImage!),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  width: double.infinity,
                  child: Text(
                    detail.description!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(detail.url!),
              ],
            ),
          ),
        );
      },
    );
  }
}
