import 'package:flutter/material.dart';
import 'package:interiit_prep/shared/appColors.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.greenColor,
      ),
    );
  }
}
