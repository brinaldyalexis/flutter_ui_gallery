import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeInRightPage<T> extends CustomTransitionPage<T> {
  FadeInRightPage({
    required super.child,
    Duration duration = const Duration(milliseconds: 200),
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
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