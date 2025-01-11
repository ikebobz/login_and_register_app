import 'package:flutter/material.dart';
import 'package:login_register_app/screens/home.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:login_register_app/screens/search.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the next screen after a delay
    Timer(const Duration(seconds: 3), () {
      // Navigate to HomeScreen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of the splash screen
      body: Center(
        child: Image.asset('assets/images/splashscreen.png'), // Your logo or widget
      ),
    );
  }

  /*
  late VideoPlayerController _controller;
  bool _isVideoFinished = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/splash_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller..play()
        ..setLooping(false) // Ensure the video doesn't loop
        ..addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            setState(() {
              _isVideoFinished = true;
            });
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _controller.value.isInitialized
          ? Stack(
        children: [
          VideoPlayer(_controller),
          if (_isVideoFinished) Positioned.fill(
            child: GestureDetector(
              onTap: () {
                // Navigate to the next screen after the video finishes
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: ColoredBox(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: Text(
                    'Tap to continue',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ) else Container(),
        ],
      )
          : const CircularProgressIndicator(), // Show a loading indicator while the video is loading
      ),
    );
  }
*/}