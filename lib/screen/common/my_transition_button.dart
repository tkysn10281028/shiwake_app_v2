import 'package:flutter/material.dart';

class MyTransitionButton extends StatefulWidget {
  const MyTransitionButton(
      {super.key, required this.secondScreen, required this.controller});

  final Widget secondScreen;
  final AnimationController controller;

  @override
  _MyTransitionButtonState createState() => _MyTransitionButtonState();
}

class _MyTransitionButtonState extends State<MyTransitionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  String text = 'Go To The Next Screen';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _animation = Tween<double>(begin: 1.0, end: 70.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToSecondScreen() async {
    setState(() {
      text = '';
    });
    await _controller.forward();
    Navigator.of(context).push(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          widget.secondScreen,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: ElevatedButton(
        onPressed: _navigateToSecondScreen,
        child: Text(text),
      ),
    );
  }
}
