import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_project/Screens/BookMarkedNews.dart';
import 'package:news_project/Screens/News-List.dart';
import 'package:news_project/Screens/NewsApp.dart';
import 'package:news_project/Screens/NewsDetailScreen.dart';
import 'package:news_project/providers/NewsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});
  bool sbrightness = false;

  void brighness() => setState(() {
        sbrightness = !sbrightness;
      });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Article();
      },
      child: MaterialApp(
        title: "NewsApp",
        theme: ThemeData(
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Colors.redAccent,
                onPrimary: Colors.white,
                secondary: Colors.grey,
                onSecondary: Color.fromARGB(255, 162, 81, 176),
                error: Colors.red,
                onError: Colors.red,
                background: Colors.white,
                onBackground: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black)),
        darkTheme: ThemeData.dark(),
        themeMode: sbrightness ? ThemeMode.dark : ThemeMode.light,

        home: AnimatedSplashScreen(
          splash: Icon(Icons.newspaper_rounded),
          nextScreen: NewsApp(brighness),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.redAccent,
          duration: 30000,
          splashIconSize: double.infinity,
          centered: true,
        ),

        // initialRoute: NewsApp.routename,
        routes: {
          NewsApp.routename: (context) => NewsApp(brighness),
          NewsList.routename: (context) => const NewsList(),
          NewsDetailScreen.routename: (context) => const NewsDetailScreen(),
          Bookmarked.routename: (context) => Bookmarked(),
        },
      ),
    );
  }
}
