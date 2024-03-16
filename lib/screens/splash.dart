import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jsr_tiffin/screens/phone.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: EasySplashScreen(
            gradientBackground: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white60, Colors.white10]),
            logoWidth: 100,
            logo: Image.asset(
              'assests/images/splash.png',
            ),
            title: const Text(
              "JSR Tiffin Service",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.pink.withOpacity(0.3),
            showLoader: true,
            loadingText: const Text("Loading..."),
            navigator: const LogIn(),
            durationInSeconds: 5,
          ),
        ),
      ),
    );
  }
}
