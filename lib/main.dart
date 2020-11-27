import 'package:flutter/material.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/start_page.dart';
import 'package:newsapp/screens/technology_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("test");
    return MaterialApp(
      home: StartPage(),
      routes: {
        BusinessNews.id: (context) => BusinessNews(),
        SportsNews.id: (context) => SportsNews(),
        ScienceNews.id: (context) => ScienceNews(),
        TechologyNews.id: (context) => TechologyNews(),
      },
    );
  }
}
