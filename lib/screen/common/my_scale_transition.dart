import 'package:flutter/material.dart';

class MyScaleTransition {
  static Route create({
    required Widget widget,
    required Duration duration,
    required Cubic curve,
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        var scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          alignment: Alignment.topCenter, // ここでアニメーションの開始位置を設定
          child: child,
        );
      },
    );
  }
}
