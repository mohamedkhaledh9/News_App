import 'package:flutter/material.dart';
import 'package:newsapp/constans.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';
import 'package:newsapp/widgets/view_news.dart';

class TechnologyNews extends StatefulWidget {
  static String id = 'TechnologyNews';

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<TechnologyNews> {
  NewsApi _newsApi = NewsApi();
  List<Article> _technologyArticles = [];
  Future<List<Article>> getTechnologyArticles() async {
    List<Article> articles = await _newsApi.fetchArticleByCategory(kTechnology);
    if(mounted)setState(() {
      _technologyArticles = articles;
    });
    return articles;
  }

  @override
  void initState() {
    super.initState();
    getTechnologyArticles();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ViewNews(
        appBarTitle: "Top Technology News",
        articles: _technologyArticles,
        screenHieght: screenHeight,
        screenWidth: screenWidth);
  }
}
