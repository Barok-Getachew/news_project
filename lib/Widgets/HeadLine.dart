import 'package:flutter/material.dart';
import 'package:news_project/Screens/NewsDetailScreen.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(NewsDetailScreen.routename),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft, child: Text('date')),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'A Headline article apears larger to grap more attention.....',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
