import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/appColors.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.item,
    required this.quantity,
}) : super(key: key);

  final String item, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            item,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryBlackColor,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Text(
            quantity,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryBlackColor,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
