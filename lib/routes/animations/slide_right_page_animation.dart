import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideRightPage<T> extends CustomTransitionPage<T> {
  SlideRightPage({
    required super.child,
    Duration duration = const Duration(milliseconds: 200), // Define la duración aquí
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: duration, // Aplica la duración aquí
        );
}