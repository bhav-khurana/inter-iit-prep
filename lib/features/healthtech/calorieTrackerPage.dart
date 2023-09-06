import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/progessIndicator.dart';
import 'package:interiit_prep/features/healthtech/functions/api.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/foodItemsContainer.dart';

class CalorieTrackerPage extends StatefulWidget {
  const CalorieTrackerPage({Key? key}) : super(key: key);

  @override
  State<CalorieTrackerPage> createState() => _CalorieTrackerPageState();
}

class _CalorieTrackerPageState extends State<CalorieTrackerPage> {

  refresh() {
    setState(() {});
  }

  Future<List<int>> getCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('calorieGoal') != null) {
      int calorieGoal = prefs.getInt('calorieGoal') ?? 0;
      int currCalories = prefs.getInt('currCalories') ?? 0;
      return [calorieGoal, currCalories];
    } else {
      String gender = prefs.getString('userGender') ?? 'Male';
      int age = prefs.getInt('userAge') ?? 20;
      int currWeight = prefs.getInt('userCurrWeight') ?? 54;
      int targetWeight = prefs.getInt('userTargetWeight') ?? 65;
      String expectedTime = prefs.getString('userExpectedTime') ?? '4 weeks';
      String comments = prefs.getString('userComments') ?? '';
      int calorieGoal = await API.getCalorieCount([], gender, age, currWeight, targetWeight, expectedTime, comments);
      int currCalories = prefs.getInt('currCalories') ?? 0;
      await prefs.setInt('calorieGoal', calorieGoal);
      return [calorieGoal, currCalories];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.greenColor
          ),
          width: screenWidth,
          child: Center(
            child: FutureBuilder(
              future: getCalories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error :(');
                  }
                  List<int> data = snapshot.data ?? [0,0];
                  int goal = data[0], current = data[1];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily Goal: $goal cal',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 14,),
                      CircleProgress(currValue: current, totalValue: goal),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
        FoodItemsContainer(foodType: 'Breakfast', refresh: refresh),
        FoodItemsContainer(foodType: 'Lunch', refresh: refresh),
        FoodItemsContainer(foodType: 'Dinner', refresh: refresh),
      ],
    );
  }
}
