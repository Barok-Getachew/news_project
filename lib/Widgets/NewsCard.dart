import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:news_project/Screens/NewsDetailScreen.dart';

class NewsCards extends StatelessWidget {
  // final String imageUrl;
  final String title;

  const NewsCards({required this.title, super.key});
//  required this.imageUrl
  @override
  Widget build(BuildContext context) {
    // final FetchedNews = Provider.of<Article>(context).Newss;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(NewsDetailScreen.routename, arguments: title),
          child: Card(
            elevation: 3,
            child: SizedBox(
              width: 400,
              child: Row(children: [
                // Container(
                //   height: 135,
                //   width: 170,
                //   child: Image.network(
                //       // imageUrl,
                //       // fit: BoxFit.cover,
                //       ),
                // ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 140,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
