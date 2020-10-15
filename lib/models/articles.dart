import 'package:newsapp/models/article.dart';

class Articles {
  List<dynamic> articles;
  Articles({this.articles});
  factory Articles.fromJson(Map<String, dynamic> jsonData) {
    return Articles(articles: jsonData['articles']);
  }
}
