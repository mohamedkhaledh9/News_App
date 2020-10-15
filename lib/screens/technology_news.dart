import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/widgets/view_news.dart';

class TechnologyNews extends StatelessWidget {
  static String id = 'TechnologyNews';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Article> _technologyArticles =
        ModalRoute.of(context).settings.arguments;
    return viewNews(_technologyArticles, "Top Technology News", screenHeight,
        screenWidth, context);
  }
}
