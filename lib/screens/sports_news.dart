import 'package:flutter/material.dart';
import 'package:newsapp/constans.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';
import 'package:newsapp/widgets/view_news.dart';

class SportsNews extends StatefulWidget {
  static String id = 'SportsNews';

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  NewsApi _newsApi = NewsApi();
  List<Article> _sportsArticles = [];
  Future<Article> getSportsArticles() async {
    List<Article> articles = await _newsApi.fetchArticleByCategory(kSports);
    if(mounted)setState(() {
      _sportsArticles = articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getSportsArticles();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ViewNews(
        appBarTitle: "Top Sports News",
        articles: _sportsArticles,
        screenHieght: screenHeight,
        screenWidth: screenWidth);
  }
}
