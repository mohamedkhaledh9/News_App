import 'package:flutter/material.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/technology_news.dart';

import '../constans.dart';

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
          backgroundColor: kMainColor,
          title: Text("All News"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Column(
                children: [
                  Icon(Icons.business),
                  Text(
                    "Business",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.sports),
                  Text(
                    "Sports",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.biotech_outlined),
                  Text(
                    "Technology",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.science),
                  Text(
                    "Science",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
            onTap: (value) {
              if(mounted) setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            BusinessNews(),
            SportsNews(),
            TechnologyNews(),
            ScienceNews(),
          ],
        ),
      ),
    );
  }
}
