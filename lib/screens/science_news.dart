import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/widgets/view_news.dart';

class ScienceNews extends StatelessWidget {
  static String id = 'ScienceNews';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Article> _scienceArticles = ModalRoute.of(context).settings.arguments;
    return viewNews(_scienceArticles, "Top Science News", screenHeight,
        screenWidth, context);
  }
}
