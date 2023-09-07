import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 17)),
      ),
    );
  }
}
