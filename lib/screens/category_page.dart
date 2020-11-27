import 'package:flutter/material.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/technology_news.dart';

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

int currentIndex = 0;

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("All News"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Text(
                "Business",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "Sports",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "Technology",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "Science",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            BusinessNews(),
            SportsNews(),
            TechologyNews(),
            ScienceNews(),
          ],
        ),
      ),
    );
  }
}
