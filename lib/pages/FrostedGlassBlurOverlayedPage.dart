import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class FrostTransitionWidget extends AnimatedWidget {
  FrostTransitionWidget({this.child, this.animation}) : super(listenable: animation);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext build) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
      child: Container(
        child: child,
      ),
    );
  }
}

class FrostedGlassBlurOverlayedPage extends PopupRoute<Null> {
  FrostedGlassBlurOverlayedPage({this.animationStartValue, this.animationEndValue, this.page, this.animationDuration}) : super();

  double animationStartValue, animationEndValue;
  Duration animationDuration;
  Widget page;

  @override
  ui.Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "Close";

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FrostTransitionWidget(
      animation: Tween<double>(
        begin: animationStartValue,
        end: animationEndValue,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return page;
  }
}
