import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/article.dart';
import 'package:flutter/material.dart';
import '../functions.dart';

Widget ViewNews(List<Article> articles, String appBarTitle, double screenHeight,
    double screenWidth, BuildContext context) {
  try {
    if (articles.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Text("Loading ....."),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            appBarTitle,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  {
                    if (articles[index].title != null &&
                        articles[index].description != null &&
                        articles[index].url != null &&
                        articles[index].imageUrl != null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.indigo,
                          ),
                          // color: Colors.indigo,
                          height: screenHeight,
                          width: screenWidth * .5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  articles[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Text(
                                  articles[index].description,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  height: screenHeight * .4,
                                  image: NetworkImage(articles[index].imageUrl),
                                  fit: BoxFit.fill,
                                  matchTextDirection: true,
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: FlatButton(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  onPressed: () async {
                                    Functions _functions = Functions();
                                    await _functions
                                        .url_Launcher(articles[index].url);
                                  },
                                  child: Text(
                                    "read more",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      articles[index] = articles[index + 1];
                    }
                  }
                },
                itemCount: articles.length,
              ),
            )
          ],
        ),
      );
    }
  } catch (e) {
    print(e.message);
  }
}
