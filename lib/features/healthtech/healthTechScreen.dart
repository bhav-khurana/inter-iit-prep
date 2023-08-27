import 'package:flutter/material.dart';
import 'package:interiit_prep/features/healthtech/infoPage.dart';

class HealthTechScreen extends StatefulWidget {
  const HealthTechScreen({Key? key}) : super(key: key);

  @override
  State<HealthTechScreen> createState() => _HealthTechScreenState();
}

class _HealthTechScreenState extends State<HealthTechScreen> {

  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  PageController pageController = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView(

          scrollDirection: Axis.horizontal,
          controller: pageController,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
            });
          },

          children: [
            InfoPage(question: 'What\'s your gender?', hint: 'Male/Female', controller: genderController, isLastPage: false,),
            InfoPage(question: 'What\'s your current weight? (in kg)', hint: 'e.g. 50, 65', controller: weightController, isLastPage: false,),
            InfoPage(question: 'What\'s your target weight? (in kg)', hint: 'e.g. 50, 70', controller: targetWeightController, isLastPage: false,),
            InfoPage(question: 'Expected duration to reach your target', hint: 'e.g. 2 weeks, 1 month', controller: durationController, isLastPage: true,),
          ],

        )
      ),
    );
  }
}
