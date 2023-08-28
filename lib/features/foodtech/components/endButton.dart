import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndButton extends StatelessWidget {
  const EndButton({
    Key? key,
    required this.text,
    required this.color,
}) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 47,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
