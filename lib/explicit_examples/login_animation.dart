import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  //TickerProviderStateMixin for multiple tickers. TIckers keep track of frame rate to animate the widget smoothly within defined time
  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double>
      scaleAnimation; //for texts to animate from smaller to bigger
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    controller.forward(); //it will start animating the widget
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    logoFadeAnimation.addListener(() {
      if (logoFadeAnimation.isCompleted) {
        controller.reverse();
      }
    });
    slideAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    scaleAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: logoFadeAnimation,
                child: const FlutterLogo(
                  size: 100.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ScaleTransition(
                  scale: scaleAnimation, //for texts
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
