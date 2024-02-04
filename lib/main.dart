import 'package:flutter/material.dart';
import 'package:shiwake_app_v2/screen/common/my_transition_button.dart';

void main() => runApp(const MaterialApp(
      title: 'Button Expand Animation Demo',
      home: FirstScreen(),
    ));

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: Navigator.of(context), // vsyncにナビゲーターを使用
    );

    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      MyTransitionButton(
        secondScreen: SecondScreen(controller: controller),
        controller: controller,
      )
    ]));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Second Screen'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to Second Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go back to First Screen'),
              onPressed: () async {
                await controller.reverse();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
