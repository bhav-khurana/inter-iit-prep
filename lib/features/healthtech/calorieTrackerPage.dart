import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/progessIndicator.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: screenWidth, color: AppColors.greenColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daily Goal: 2200',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14,),
                CircleProgress(currValue: 864, totalValue: 2200),
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
