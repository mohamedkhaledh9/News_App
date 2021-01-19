import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/constans.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/services/fetch_data.dart';
import 'package:newsapp/widgets/view_news.dart';

class BusinessNews extends StatefulWidget {
  static String id = 'BusinessNews';

  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  NewsApi _newsApi = NewsApi();
  List<Article> _businessArticles = [];
  Future<List<Article>> getBusinessArticles() async {
    List<Article> articles = await _newsApi.fetchArticleByCategory(kBusiness);
    if(mounted)setState(() {
      _businessArticles = articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getBusinessArticles();
  }

  @override
  Widget build(BuildContext context) {
    print(_businessArticles);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ViewNews(
        appBarTitle: "Top Business News",
        articles: _businessArticles,
        screenHieght: screenHeight,
        screenWidth: screenWidth);
  }
}
