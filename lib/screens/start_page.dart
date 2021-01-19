import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/all_news.dart';
import 'package:newsapp/screens/category_page.dart';

import '../constans.dart';

class StartPage extends StatefulWidget {
  static String id = "StartPage";
  @override
  _StsrtPageState createState() => _StsrtPageState();
}

int currentIndex = 0;
List<Widget> widgets = [
  AllNews(),
  CategoryPage(),
];

class _StsrtPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: kMainColor,
        buttonBackgroundColor:Colors.blueGrey,
        index: currentIndex,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 50),
        items: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(height: 7,),
              Icon(Icons.home),
              Text("All News"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(height: 7,),
              Icon(Icons.category),
              Text("Category",style: TextStyle(fontWeight: FontWeight.bold),),
            ],),
          ),
        ],
        onTap: (value) {
          if(mounted)setState(() {
            currentIndex = value;
          });
        },
      ),
      body: widgets[currentIndex],
    );
  }
}
