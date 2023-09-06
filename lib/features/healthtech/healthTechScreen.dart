import 'package:flutter/material.dart';
import 'package:interiit_prep/features/healthtech/calorieTrackerPage.dart';
import 'package:interiit_prep/features/healthtech/infoPage.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthTechScreen extends StatefulWidget {
  const HealthTechScreen({Key? key}) : super(key: key);

  @override
  State<HealthTechScreen> createState() => _HealthTechScreenState();
}

class _HealthTechScreenState extends State<HealthTechScreen> {

  refresh() {
    setState(() {});
  }

  Future<bool> showCalorieTracker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool show = prefs.getBool('showCalorieTracker') ?? false;
    return show;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: showCalorieTracker(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // todo: handle snapshot error
            bool data = snapshot.data ?? false;
            if (data) {
              return CalorieTrackerPage();
            } else {
              return InfoPages(refresh: refresh,);
            }
          }
          return Center(child: CircularProgressIndicator(color: AppColors.greenColor,),);
        },
      ),
      // child: CalorieTrackerPage(),
    );
  }
}

class InfoPages extends StatefulWidget {
  const InfoPages({
    Key? key,
    required this.refresh,
  }) : super(key: key);

  final VoidCallback refresh;

  @override
  State<InfoPages> createState() => _InfoPagesState();
}

class _InfoPagesState extends State<InfoPages> {

  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  PageController pageController = PageController();
  int _curr = 0;

  Future<void> setTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showCalorieTracker', true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PageView(
        // pageSnapping: false,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            _curr = page;
          });
        },
        children: [
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'What\'s your gender?', hint: 'Male/Female', controller: genderController, buttonText: 'Next >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userGender', genderController.text);
            pageController.jumpToPage(_curr+1);
          },),
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'What\'s your age (in years)?', hint: 'e.g. 20, 45', controller: ageController, buttonText: 'Next >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userAge', int.parse(ageController.text));
            pageController.jumpToPage(_curr+1);
          },),
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'What\'s your current weight? (in kg)', hint: 'e.g. 50, 65', controller: weightController, buttonText: 'Next >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userCurrWeight', int.parse(weightController.text));
            pageController.jumpToPage(_curr+1);
          },),
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'What\'s your target weight? (in kg)', hint: 'e.g. 50, 70', controller: targetWeightController, buttonText: 'Next >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userTargetWeight', int.parse(targetWeightController.text));
            pageController.jumpToPage(_curr+1);
          },),
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'Expected duration to reach your target', hint: 'e.g. 2 weeks, 1 month', controller: durationController, buttonText: 'Next >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userExpectedTime', durationController.text);
            pageController.jumpToPage(_curr+1);
          },),
          InfoPage(title: 'Let\'s start by asking a few questions', question: 'Any other comments?', hint: 'e.g. i take these medicines daily, etc.', controller: commentsController, buttonText: 'Get Started >', func: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userComments', commentsController.text);
            await setTrue();
            widget.refresh();
          },),
        ],
      ),
    );
  }
}

