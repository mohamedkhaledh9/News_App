import 'package:animated_button/animated_button.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/article.dart';
import 'package:flutter/material.dart';
import '../constans.dart';
import '../functions.dart';

class ViewNews extends StatefulWidget {
  final List<Article> articles;
  final String appBarTitle;
  final double screenHieght;
  final double screenWidth;

  const ViewNews(
      {this.articles, this.appBarTitle, this.screenHieght, this.screenWidth});

  @override
  _ViewNewsState createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  bool isConnected;
  GlobalKey<RefreshIndicatorState> refreshKey;

  Future<void> checkInterNetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      print("No InterNet Connection");
      if (mounted)
        setState(() {
          isConnected = false;
        });
    } else {
      print("Connection Done :) ");
      if (mounted)
        setState(() {
          isConnected = true;
        });
    }
  }

  @override
  void initState() {
    super.initState();
    checkInterNetConnection();
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (isConnected == false) {
        return Scaffold(
          appBar: AppBar(
            title: ListTile(
              title: Text(
                "Connection Failed",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.wifi_protected_setup,
                color: Colors.white,
              ),
            ),
            backgroundColor: kMainColor,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await checkInterNetConnection();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Builder(builder: (context) {
                    return AlertDialog(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.wifi_protected_setup,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Connection Error"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 3,
                              color: Colors.black26,
                              thickness: 3,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        content: Text(
                          "Check Your InterNet Connection",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red,
                        scrollable: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        actions: [
                          Row(
                            children: [
                              Icon(
                                Icons.network_check,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.network_locked_outlined,
                                size: 30,
                              ),
                            ],
                          )
                        ]);
                  }),
                ),
              ],
            ),
          ),
        );
      } else if (widget.articles.isEmpty) {
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
      } else
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              widget.appBarTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: RefreshIndicator(
            displacement: 100,
            key: refreshKey,
            onRefresh: () async {
              await checkInterNetConnection();
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      {
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kMainColor),
                            // color: Colors.indigo,
                            height: widget.screenHieght,
                            width: widget.screenWidth * .5,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      widget.articles[index].title == null
                                          ? "No Title"
                                          : widget.articles[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 23),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black26,
                                  height: 15,
                                  thickness: 4,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: widget.articles[index].imageUrl == null
                                      ? Container(
                                          height: widget.screenHieght * .4,
                                          color: Colors.blueGrey,
                                          child: Center(
                                            child: Text("No Image"),
                                          ),
                                        )
                                      : Image(
                                          height: widget.screenHieght * .4,
                                          image: NetworkImage(
                                              widget.articles[index].imageUrl),
                                          fit: BoxFit.fill,
                                          matchTextDirection: true,
                                        ),
                                ),

                                Divider(
                                  color: Colors.black26,
                                  height: 15,
                                  thickness: 4,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                //SizedBox(height: 10,),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Container(
                                    height: widget.screenHieght * .25,
                                    width: widget.screenWidth,
                                    child: Text(
                                      widget.articles[index].description == null
                                          ? "No Description"
                                          : widget.articles[index].description,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white70),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AnimatedButton(
                                  enabled: true,
                                  shadowDegree: ShadowDegree.light,
                                  height: 40,
                                  width: 150,
                                  color: Colors.black26,
                                  onPressed: () async {
                                    Functions _functions = Functions();
                                    await _functions.url_Launcher(
                                        widget.articles[index].url);
                                  },
                                  child: Text(
                                    "read more >>",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    itemCount: widget.articles.length,
                  ),
                )
              ],
            ),
          ),
        );
    } catch (e) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: ()async{
            await checkInterNetConnection();
          },
          child: ListView(
            children: [
              SizedBox(height:200),
              Center(child: Text("Faild Loading Try Again..."),),

            ],
          ),
        ),
      );
    }
  }
}
