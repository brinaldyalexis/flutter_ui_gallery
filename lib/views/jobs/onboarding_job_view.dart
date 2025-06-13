import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';


class OnboardingJobView extends StatelessWidget {
  const OnboardingJobView({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FadeInDown(
            child: Container(
              height: 200,
              margin: EdgeInsets.only(
                top: 80,
                left: 20,
                right: 20,
              ),
              child: Image.asset(
                'assets/images/briefcase.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          FadeIn(
            delay: const Duration(milliseconds: 300),
            child: Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 40,
                right: 40,
              ),
              child: Column(
                children: [
                  const Text(
                    'Discover your',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Dream Job here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 17), // 0.02 * 844 ≈ 17
                  const Text(
                    'Find the perfect job that matches your skills and interests.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 180),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BuildButton(
                  text: 'Login',
                  onPressed: () {
                    // Navigate to Login Job View
                    debugPrint('Login button pressed');
                    context.push('/jobs/signin');
                  },
                  backgroundColor: Color(0xFF0E7869),
                  foregroundColor: Colors.white
                ),
                _BuildButton(
                  text: 'Register',
                  onPressed: () {
                    // Navigate to Signup Job View
                    debugPrint('Register button pressed');
                    context.push('/jobs/signup');
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ],
            ),
          )
        ],
      )
    );
  }



}

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    required this.text,
    required this.foregroundColor,
    required this.onPressed,
    required this.backgroundColor
  });

  final String text;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: Colors.white,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      elevation: 0,
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, 
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: foregroundColor,
        ),
      ),
    );
  }
}