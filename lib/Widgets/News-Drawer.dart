import 'package:flutter/material.dart';
import 'package:news_project/Screens/BookMarkedNews.dart';

class NewsDrawer extends StatefulWidget {
  final VoidCallback newsBrightness;
  const NewsDrawer(this.newsBrightness, {super.key});

  @override
  State<NewsDrawer> createState() => _NewsDrawerState();
}

class _NewsDrawerState extends State<NewsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 235,
        elevation: 3,
        child: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.redAccent,
                        child: Icon(
                          Icons.newspaper_outlined,
                          size: 50,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.black45),
                          child: IconButton(
                              onPressed: widget.newsBrightness,
                              icon: const Icon(Icons.sunny)),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.newspaper_rounded),
                    title: const Text('News Feed'),
                    onTap: (() {}),
                  ),
                  ListTile(
                    leading: const Icon(Icons.auto_stories_rounded),
                    title: const Text('Top Stories'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_add_rounded),
                    title: const Text('BookMarked'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Bookmarked.routename),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Topics',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.table_chart_outlined),
                        title: const Text('Tech'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.sports),
                        title: const Text('Sports'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.girl_outlined),
                        title: const Text('Beauty'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.business_center_rounded),
                        title: const Text('Business'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.four_g_plus_mobiledata_rounded),
                        title: const Text('World'),
                        onTap: (() {}),
                      ),
                      ListTile(
                        leading: const Icon(Icons.food_bank_outlined),
                        title: const Text('Food'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.more),
                        title: const Text('more'),
                        onTap: (() {}),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      ListTile(
                        leading: const Icon(Icons.question_mark),
                        title: const Text('Info'),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
