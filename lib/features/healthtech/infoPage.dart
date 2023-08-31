import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/doctorListPage.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/shared/textWidgets.dart';

import '../../shared/appColors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.question,
    required this.hint,
    required this.controller,
    required this.buttonText,
    required this.func,
  }) : super(key: key);

  final String question, hint;
  final TextEditingController controller;
  final String buttonText;
  final Function func;

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
        const SizedBox(height: 24,),
        GestureDetector(
          onTap: (){
            widget.func();
          },
          child: Text(
            widget.buttonText,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline
                )
            ),
          ),
        )
      ],
    );
  }
}
