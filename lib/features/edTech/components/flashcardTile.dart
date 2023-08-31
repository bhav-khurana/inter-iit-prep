import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/components/infoText.dart';
import 'package:interiit_prep/shared/appColors.dart';

class FlashcardTile extends StatefulWidget {
  const FlashcardTile({
    Key? key,
    required this.name,
    required this.noOfCards,
}) : super(key: key);

  final String name;
  final int noOfCards;

  @override
  State<FlashcardTile> createState() => _FlashcardTileState();
}

class _FlashcardTileState extends State<FlashcardTile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: screenSize.width,
      height: screenSize.height*0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: AppColors.greenColor)
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/flashcardLogo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryBlackColor
                    )
                ),
              ),
              InfoText(text: '${widget.noOfCards} cards')
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert, color: AppColors.greenColor,),
        ],
      ),
    );
  }
}
