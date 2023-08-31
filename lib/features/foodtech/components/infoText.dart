import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/appColors.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.text,
}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.infoGreyColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
