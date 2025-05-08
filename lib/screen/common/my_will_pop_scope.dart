import 'package:flutter/material.dart';

class MyWillPopScope extends StatelessWidget {
  const MyWillPopScope(
      {super.key, required this.child, required this.onWillPopFunc});

  final Widget child;
  final Future<bool> Function() onWillPopFunc;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: onWillPopFunc, child: child);
  }
}
