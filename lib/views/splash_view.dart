import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/views/home_page_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  bool _showColoredText = false;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _startTimerForNavigation();
    _triggerColoredText();
  }

  /// Initialize fade animation for the splash screen
  void _initAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Fade-in duration
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    _controller!.forward();
  }

  /// Navigate to the HomePageView after a delay with a fade transition
  void _startTimerForNavigation() {
    Timer(const Duration(seconds: 5), () {
      _navigateToHome();
    });
  }

  /// Show colored text after a delay
  void _triggerColoredText() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showColoredText = true;
      });
    });
  }

  /// Fade transition to HomePageView
  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePageView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _showColoredText ? _buildColoredText() : _buildAnimatedText(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the logo widget
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      width: 250,
      height: 250,
    );
  }

  /// Builds the animated typewriter text (before color)
  Widget _buildAnimatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'TODO',
          textStyle: const TextStyle(
            fontSize: 60,
            color: Colors.black, // Default color during animation
            fontFamily: 'Poppins',
          ),
          speed: const Duration(milliseconds: 300), // Typing speed
          textAlign: TextAlign.center,
        ),
      ],
      totalRepeatCount: 1,
      isRepeatingAnimation: false,
    );
  }

  /// Builds the colored "TODO" text after animation completes
  Widget _buildColoredText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'TO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: kPrimaryColor, // Color for "TO"
            ),
          ),
          TextSpan(
            text: 'DO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: kPrimaryColor.withOpacity(0.5), // Color for "DO"
            ),
          ),
        ],
      ),
    );
  }
}
