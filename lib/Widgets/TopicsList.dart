import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_project/Screens/News-List.dart';
import 'package:news_project/Widgets/HeadLine.dart';
import 'package:news_project/Widgets/dialoguebox.dart';

class TopicsList extends StatelessWidget {
  final String CategoryName;
  final String imageUrl;
  TopicsList({required this.CategoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Dialog(
      //   backgroundColor: Colors.amber,
      //   child: Text('hello world'),
      // ),
      onTap: () => Navigator.of(context)
          .pushNamed(NewsList.routename, arguments: CategoryName),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          Positioned(
              left: 20,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(color: Colors.black45),
                child: Text(
                  CategoryName,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )),
        ]),
      ),
    );
  }
}
