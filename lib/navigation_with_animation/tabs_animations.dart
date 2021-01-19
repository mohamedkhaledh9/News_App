import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TabsAnimations extends StatefulWidget {
  Widget child;
  TabsAnimations(this.child);

  @override
  _TabsAnimationsState createState() => _TabsAnimationsState();
}

class _TabsAnimationsState extends State<TabsAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController = AnimationController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context,child){

        return Transform.rotate(
          angle: _animationController.value*.2*math.pi,
          child: child,
        );
      },
    );
  }
}
