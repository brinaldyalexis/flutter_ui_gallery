import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeInLeftPage<T> extends CustomTransitionPage<T> {
  FadeInLeftPage({
    required super.child,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );
}