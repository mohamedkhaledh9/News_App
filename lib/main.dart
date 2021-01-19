import 'package:flutter/material.dart';
import 'package:newsapp/screens/business_news_screen.dart';
import 'package:newsapp/screens/science_news.dart';
import 'package:newsapp/screens/sports_news.dart';
import 'package:newsapp/screens/start_page.dart';
import 'package:newsapp/screens/technology_news.dart';
import 'package:catcher/catcher.dart';
void main() {
  CatcherOptions debugOptions =
  CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["support@email.com"])
  ]);
  Catcher(rootWidget: MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        BusinessNews.id: (context) => BusinessNews(),
        SportsNews.id: (context) => SportsNews(),
        ScienceNews.id: (context) => ScienceNews(),
        TechnologyNews.id: (context) => TechnologyNews(),
      },
    );
  }
}
