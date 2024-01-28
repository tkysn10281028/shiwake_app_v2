
import 'package:flutter/material.dart';
import 'package:shiwake_app_v2/screen/common/my_base_color_screen.dart';
import 'package:shiwake_app_v2/screen/common/my_slide_transition.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MySlideTransition.create(
                widget: MyBaseColorScreen(color: Colors.purple[100]!),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutSine));
          },
          child: const Text('Go to New Screen'),
        ),
      ),
    );
  }
}
