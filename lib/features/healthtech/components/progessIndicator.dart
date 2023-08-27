import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../shared/appColors.dart';

class CircleProgress extends StatefulWidget {
  const CircleProgress({Key? key, required this.currValue, required this.totalValue}) : super(key: key);
  final int currValue, totalValue;

  @override
  State<CircleProgress> createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
      radius: 70.0,
      lineWidth: 15.0,
      percent: widget.currValue/widget.totalValue,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'Intake',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryColor
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Text(
            '${widget.currValue}',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                )
            ),
          ),
          Spacer()
        ],
      ),
      backgroundColor: AppColors.primaryBlackColor,
      progressColor: AppColors.primaryColor,
    );
  }
}
