import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/articles.dart';

class NewsApi {
  Future<List<Article>> fetchArticles() async {
    final String apiKey = '2b5d2cac2b32484eb69cadbb00f71cb0';
    try {
      http.Response _response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
      if (_response.statusCode == 200) {
        String data = _response.body;
        var _jsonData = jsonDecode(data);
        Articles _articles = Articles.fromJson(_jsonData);
        List<Article> articlseList =
            _articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlseList;
      } else {
        debugPrint("staus response code is ${_response.statusCode}");
      }
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<List<Article>> fetchArticleByCategory(String category) async {
    final String apiKey = '2b5d2cac2b32484eb69cadbb00f71cb0';
    try {
      http.Response _response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');

      if (_response.statusCode == 200) {
        String data = _response.body;
        var _jsonData = jsonDecode(data);
        Articles _articles = Articles.fromJson(_jsonData);

        List<Article> articlesList =
            _articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        debugPrint('status code is ${_response.statusCode}');
      }
    } catch (e) {
      print(e.message);
    }
  }
}
