import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/shared/appColors.dart';

class MediumText extends StatelessWidget {
  const MediumText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20,
              color: AppColors.primaryBlackColor
          )
      ),
    );
  }
}
