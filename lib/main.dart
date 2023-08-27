import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:interiit_prep/features/welcome/welcomeScreen.dart';
import 'package:interiit_prep/shared/appColors.dart';

import 'home.dart';

void main() async {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/welcome': (context) => const WelcomeScreen(),
          '/home': (context) => const Home(page: 0,),
        },
      )
  );
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: const Icon(Icons.home),
        splashIconSize: 220,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppColors.primaryColor,
        nextScreen: const Home(page: 0,),
      ),
    );
  }
}
