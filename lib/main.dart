import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/home_page.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/technology_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        GeneralNews.id: (context) => GeneralNews(),
        SportsNews.id: (context) => SportsNews(),
        ScienceNews.id: (context) => ScienceNews(),
        TechnologyNews.id: (context) => TechnologyNews(),
      },
    );
  }
}
