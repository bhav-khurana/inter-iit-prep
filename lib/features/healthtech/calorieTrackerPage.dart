import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/progessIndicator.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/foodItemsContainer.dart';

class CalorieTrackerPage extends StatefulWidget {
  const CalorieTrackerPage({Key? key}) : super(key: key);

  @override
  State<CalorieTrackerPage> createState() => _CalorieTrackerPageState();
}

class _CalorieTrackerPageState extends State<CalorieTrackerPage> {

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daily Goal: 2200',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14,),
                CircleProgress(currValue: 1932, totalValue: 2200),
              ],
            ),
          ),
        ),
        FoodItemsContainer(foodType: 'Breakfast',),
        FoodItemsContainer(foodType: 'Lunch',),
        FoodItemsContainer(foodType: 'Dinner',),
      ],
    );
  }
}
