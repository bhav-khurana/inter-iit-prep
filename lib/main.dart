import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interiit_prep/features/welcome/landingPage.dart';
import 'package:interiit_prep/shared/appColors.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/welcome': (context) => const LandingPage(),
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
        splash: const Icon(Icons.home,),
        splashIconSize: 220,
        duration: 10,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppColors.primaryColor,
        nextScreen: LandingPage(),
      ),
    );
  }
}
