import 'package:flutter/material.dart';

class FadeSlideAnimation extends StatelessWidget {
  final Widget child;
  final int delay;
  final double beginY;

  const FadeSlideAnimation({
    super.key,
    required this.child,
    this.delay = 0,
    this.beginY = 30,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 500 + delay),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, beginY * (1 - value)),
            child: child,
          ),
        );
      },
    );
  }
}