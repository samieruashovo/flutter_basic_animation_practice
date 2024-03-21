import 'package:animation_starter_code/explicit_examples/login_animation.dart';
import 'package:animation_starter_code/implicit_examples/animated_color_pallete.dart';
import 'package:flutter/material.dart';

import 'custom_painter_example/bouncing_ball_animation.dart';
import 'explicit_examples/list_animation.dart';
import 'explicit_examples/loading_animation.dart';
import 'implicit_examples/animated_shopping_cart_button.dart';
import 'implicit_examples/animated_tween_animation_builder_example.dart';
import 'page_route_builder_animation/splash_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BouncingBallAnimation());
  }
}
