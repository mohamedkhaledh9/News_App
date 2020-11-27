import 'package:flutter/material.dart';
import 'package:newsapp/constans.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';
import 'package:newsapp/widgets/view_news.dart';

class ScienceNews extends StatefulWidget {
  static String id = 'ScienceNews';

  @override
  _ScienceNewsState createState() => _ScienceNewsState();
}

class _ScienceNewsState extends State<ScienceNews> {
  NewsApi _newsApi = NewsApi();
  List<Article> _scienceArticles = [];
  Future<Article> getScienceArticles() async {
    List<Article> articles = await _newsApi.fetchArticleByCategory(kScience);
    setState(() {
      _scienceArticles = articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getScienceArticles();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ViewNews(_scienceArticles, "Top Science News", screenHeight,
        screenWidth, context);
  }
}
