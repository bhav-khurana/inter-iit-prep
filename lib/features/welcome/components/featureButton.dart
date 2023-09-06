import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/shared/appColors.dart';

class FeatureButton extends StatelessWidget {
  FeatureButton({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 14,),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryBlackColor
                ),
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
