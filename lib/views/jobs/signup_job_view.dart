import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

class SignUpJobView extends StatelessWidget {
  const SignUpJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInDown(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 42,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    'Sign up here',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E7869),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeIn(
                delay: Duration(milliseconds: 200),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text('Create your account to get started!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 80),
              FadeInUp(
                delay: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _TextField(
                        obscureText: false,
                        hintText: 'Email',
                      ),
                      SizedBox(height: 20),
                      _TextField(
                        obscureText: true,
                        hintText: 'Password',
                      ),
                      SizedBox(height: 20),
                      _TextField(
                        obscureText: true,
                        hintText: 'Confirm Password',
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          // Handle signup action
                        },
                        minWidth: 350,
                        color: Color(0xFF0E7869),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(width: 5),
                          Theme(
                            data: Theme.of(context).copyWith(
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              hintColor: Colors.transparent,
                            ),
                            child: TextButton(
                              onPressed: (){
                                // Navigate to Signup Job View
                                debugPrint('Sign in button pressed');
                                context.go('/jobs/signin');
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF0E7869),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Text('Or continue with',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0E7869),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeInUp(
                        delay: Duration(milliseconds: 600),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _LoginSocial(
                              imagePath: 'assets/images/facebook.png',
                              onTap: () {
                                // Handle Facebook signup
                              },
                            ),
                            SizedBox(width: 20),
                            _LoginSocial(
                              imagePath: 'assets/images/google.png',
                              onTap: () {
                                // Handle Google signup
                              },
                            ),
                            SizedBox(width: 20),
                            _LoginSocial(
                              imagePath: 'assets/images/apple.png',
                              onTap: () {
                                // Handle Apple signup
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({
    required this.obscureText,
    required this.hintText,
  });

  final bool? obscureText;
  final String hintText;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.obscureText == true;
    return TextField(
      cursorColor: Color(0xFF0E7869),
      obscureText: isPassword ? _obscure : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF0E7869).withAlpha(30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF0E7869), width: 2),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        )
            : null,
      ),
    );
  }
}

class _LoginSocial extends StatelessWidget {
  const _LoginSocial({
    required this.imagePath,
    required this.onTap,
  });

  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
