import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class RecoveryPasswordView extends StatelessWidget {
  const RecoveryPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: BackButton()
              ),
              FadeInDown(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: const Text(
                    'Recovery Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E7869),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeIn(
                delay: Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Text(
                    'Enter your email to receive a link to reset your password.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                delay: Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _TextField(
                        obscureText: false,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          // Handle recovery password logic
                        },
                        minWidth: 350,
                        color: Color(0xFF0E7869),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
