import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/components/infoText.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'components/flashcard.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({
    Key? key,
    required this.flashcardContent,
    required this.title,
    required this.noOfCards,
  }) : super(key: key);

  final String flashcardContent, title;
  final int noOfCards;

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  bool done = false;
  int counter = 1;

  List<String> getFlashcards() {
    List<String> flashcards = widget.flashcardContent.split('\n');
    return flashcards.reversed.toList();
  }

  incrementCounter() {
    setState(() {
      if (counter != widget.noOfCards) {
        counter++;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: widget.title),
              SizedBox(height: 20,),
              Text(
                '   Progress: $counter/${widget.noOfCards}',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryBlackColor
                    )
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: LinearPercentIndicator(
                  barRadius: const Radius.circular(10),
                  lineHeight: 6.0,
                  backgroundColor: AppColors.lightGreyColor,
                  progressColor: AppColors.yellowColor,
                  // animation: true,
                  // animationDuration: 1000,
                  percent: counter / widget.noOfCards >= 1 ? 1 : counter / widget.noOfCards,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Flashcards(flashcards: getFlashcards(), incrementCounter: incrementCounter, counter: counter,)
              ),
              SizedBox(height: 20,),
              Center(child: InfoText(text: 'Swipe left/right to proceed'))
            ],
          ),
        ),
      ),
    );
  }
}

class Flashcards extends StatefulWidget {
  const Flashcards({required this.flashcards, required this.incrementCounter, required this.counter, Key? key}) : super(key: key);

  final List<String> flashcards;
  final VoidCallback incrementCounter;
  final int counter;

  @override
  State<Flashcards> createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return done ? Center(child: Image(image: AssetImage('assets/done.gif'), height: 200, width: 200,)) : AppinioSwiper(
      cards: [
        for (int i = 0; i < widget.flashcards.length-widget.counter+1; i++)
          Flashcard(color: Colors.white, bgcolor: AppColors.greenColor, text: widget.flashcards[i],)
      ],
      onSwipe: (idx, dir) async {
        widget.incrementCounter();
      },
      onEnd: () async {
        setState(() {
          done = true;
        });
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pop(context);
      },
    );
  }
}
