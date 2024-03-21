import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  // final double size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 200.0),
          duration: const Duration(milliseconds: 1500),
          builder: (context, size, widget) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.2),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              child:
                  widget, // by not putting the text directly here, we are preventing the text widget from building again and again inside build method. It will only build once and then it will be reused.
            );
          },
          child: const Text("Hello "),
        ),
      ),
    );
  }
}
