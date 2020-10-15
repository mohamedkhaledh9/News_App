import 'package:flutter/material.dart';
import 'package:newsapp/constans.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/technology_news.dart';
import 'package:newsapp/services/fetch_data.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NEWS APP",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select The Type Of News You Want",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: SizedBox(
              height: height * .15,
              child: RaisedButton(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  NewsApi _newsapi = NewsApi();
                  List<Article> _businessArticles =
                      await _newsapi.fetchArticleByCategory(kBusiness);
                  Navigator.pushNamed(context, GeneralNews.id,
                      arguments: _businessArticles);
                },
                child: Text(
                  "Business",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: SizedBox(
              height: height * .15,
              child: RaisedButton(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  NewsApi _newsapi = NewsApi();
                  List<Article> _technologyArticles =
                      await _newsapi.fetchArticleByCategory(kTechnology);
                  Navigator.pushNamed(context, TechnologyNews.id,
                      arguments: _technologyArticles);
                },
                child: Text(
                  "Technology",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: SizedBox(
              height: height * .15,
              child: RaisedButton(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  NewsApi _newsapi = NewsApi();
                  List<Article> _ScienceArticles =
                      await _newsapi.fetchArticleByCategory(kScience);
                  Navigator.pushNamed(context, ScienceNews.id,
                      arguments: _ScienceArticles);
                },
                child: Text(
                  "Science",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: SizedBox(
              height: height * .15,
              child: RaisedButton(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  NewsApi _newsapi = NewsApi();
                  List<Article> _sportArticles =
                      await _newsapi.fetchArticleByCategory(kSports);
                  Navigator.pushNamed(context, SportsNews.id,
                      arguments: _sportArticles);
                },
                child: Text(
                  "Sports",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
