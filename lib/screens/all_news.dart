import 'package:flutter/material.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';
import 'package:newsapp/widgets/view_news.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  NewsApi _newsApi = NewsApi();
  List<Article> allArticles = [];
  Future<List<Article>> getArticles() async {
    List<Article> articles = await _newsApi.fetchArticles();
    setState(() {
      allArticles = articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getArticles();
//
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ViewNews(
        allArticles, "General News", screenHeight, screenWidth, context);
  }
}
