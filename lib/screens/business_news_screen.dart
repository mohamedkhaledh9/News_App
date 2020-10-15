import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';

import 'package:newsapp/widgets/view_news.dart';

class GeneralNews extends StatelessWidget {
  static String id = 'GeneralNews';
  NewsApi _newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Article> _businessArticles = ModalRoute.of(context).settings.arguments;
    return viewNews(_businessArticles, "Top Business News", screenHeight,
        screenWidth, context);
  }
}
