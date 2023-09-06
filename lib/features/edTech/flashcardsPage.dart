import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/components/infoText.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'components/flashcard.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  Future<List<String>> getFlashcardData() async {
    await Future.delayed(Duration(seconds: 1));
    return ['text1', 'text2', 'text3'];
  }

  bool done = false;

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
              CustomAppBar(title: 'Anatomy'),
              SizedBox(height: 20,),
              Text(
                '   Progress: 5/8',
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
                  progressColor: AppColors.greenColor,
                  // animation: true,
                  // animationDuration: 1000,
                  percent: 200 / 300,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: FutureBuilder(
                    future: getFlashcardData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          List<String> data = (snapshot.data ?? []).reversed.toList();
                          return done ? Center(child: Image(image: AssetImage('assets/done.gif'), height: 200, width: 200,)) : AppinioSwiper(
                            cards: [
                              for (int i = 0; i < data.length; i++)
                                Flashcard(color: Colors.white, bgcolor: AppColors.greenColor, text: data[i],)
                            ],
                            onEnd: () async {
                              setState(() {
                                done = true;
                              });
                              await Future.delayed(const Duration(seconds: 4));
                              Navigator.pop(context);
                            },
                          );
                        }
                        return Center(child: Text('Oops! An error occurred :('));
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
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
