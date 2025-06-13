import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ZoomInPageAnimation<T> extends CustomTransitionPage<T> {
  ZoomInPageAnimation({
    required super.child,
    Duration duration = const Duration(milliseconds: 200),
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.ease;

            var tween = Tween(begin: 0.95, end: 1.0).chain(CurveTween(curve: curve));
            var scaleAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );
}
