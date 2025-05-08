import 'package:flutter/material.dart';

import 'my_will_pop_scope.dart';

class MyBaseColorScreen extends StatelessWidget {
  const MyBaseColorScreen({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
      ),
      body: MyWillPopScope(
          onWillPopFunc: () async {
            return true;
          },
          child: const Center()),
    );
  }
}
