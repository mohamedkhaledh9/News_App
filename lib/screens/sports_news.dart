import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/widgets/view_news.dart';

class SportsNews extends StatelessWidget {
  static String id = 'SportsNews';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Article> _sportsArticles = ModalRoute.of(context).settings.arguments;
    return viewNews(
        _sportsArticles, "Top Sports News", screenHeight, screenWidth, context);
  }
}
