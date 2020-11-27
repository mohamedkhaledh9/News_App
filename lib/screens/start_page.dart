import 'package:flutter/material.dart';
import 'package:newsapp/screens/all_news.dart';
import 'package:newsapp/screens/category_page.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new_sharp), label: "General News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new_sharp), label: "Category"),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: widgets[currentIndex],
    );
  }
}
