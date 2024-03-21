import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late List<Animation<Offset>> animations = [];
  final int itemCount = 5;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    slideAnimation = Tween(begin: const Offset(-1, -1), end: const Offset(0, 0))
        .animate(controller);
    animations = List.generate(
        itemCount,
        (index) => Tween(begin: const Offset(-1, -1), end: Offset.zero).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(index * (1 / itemCount), 1))));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text('Hello Shovo. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
