import 'package:flutter/material.dart';

class NavigationStyle extends PageRouteBuilder {
  final Widget widget;
  NavigationStyle({this.widget})
      : super(
            transitionDuration: Duration(seconds: 3),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.center,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return widget;
            });
}
