import 'package:flutter/material.dart';
import 'package:interiit_prep/home.dart';
import 'package:interiit_prep/shared/appColors.dart';

import 'components/featureButton.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(page: 0)));
                },
                child: FeatureButton(image: 'assets/calorieTracker.png', title: 'Track your Calories',),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(page: 1)));
                  },
                  child: FeatureButton(image: 'assets/doctor.png', title: 'Consult a Doctor',),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(page: 2)));
                },
                child: FeatureButton(image: 'assets/flashcards.png', title: 'Generate Flashcards',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
