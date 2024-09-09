import 'package:flutter/material.dart';
import 'dart:async';

import 'home/home.dart'; // Ensure this path is correct for your project

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Center( // Wrap in Center widget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Ensures text and image are horizontally centered
              children: [
                // Display the logo at the center
                Image(
                  image: AssetImage('logo/ARlogo.png'), // Update with correct path
                  width: 150, // Adjust the size of the logo
                  height: 150,
                ),
                // Remove or reduce the SizedBox to remove the space between logo and text
                // SizedBox(height: 0), // Optional: If you want to keep a very small space
                Text(
                  'Find, connect, move in',
                  style: TextStyle(
                    fontStyle: FontStyle.italic, // Slight italic effect
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB46146),
                  ),
                  textAlign: TextAlign.center, // Center-align the text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
