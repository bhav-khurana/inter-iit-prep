import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/shared/textWidgets.dart';

import '../../shared/appColors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.question,
    required this.hint,
    required this.controller,
    required this.isLastPage,
  }) : super(key: key);

  final String question, hint;
  final TextEditingController controller;
  final bool isLastPage;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MediumText(text: widget.question),
        const SizedBox(height: 14,),
        InputField(controller: widget.controller, hint: widget.hint),
        const SizedBox(height: 20,),
        widget.isLastPage ? Text(
          'Get Started',
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.infoGreyColor
              )
          ),
        ) : Text(
          'Swipe for next >',
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.infoGreyColor
              )
          ),
        ),
      ],
    );
  }
}
