import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/edTech/components/flashcardTile.dart';
import 'package:interiit_prep/features/edTech/createSetPage.dart';
import 'package:interiit_prep/features/edTech/flashcardsPage.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/textWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../foodtech/components/infoText.dart';

class EdTechScreen extends StatefulWidget {
  const EdTechScreen({Key? key}) : super(key: key);

  @override
  State<EdTechScreen> createState() => _EdTechScreenState();
}

class _EdTechScreenState extends State<EdTechScreen> {

  Future<List> getFlashcardSets() async {
    List flashcardSets = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List sets = prefs.getStringList('flashcardSets') ?? [];
    for (String set in sets) {
      flashcardSets.add({
        'name': set,
        'text': prefs.getString('flashcardSet $set text'),
        'noOfCards': prefs.getInt('flashcardSet $set noOfCards'),
      });
    }
    return flashcardSets;
  }

  @override
  Widget build(BuildContext context) {
    getFlashcardSets();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: 'Flashcard sets'),
            SizedBox(height: 12,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateSetPage())).then((value) {
                  setState(() {});
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greenColor),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Text(
                    'Create New +',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 17)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            FutureBuilder(
              future: getFlashcardSets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List sets = snapshot.data ?? [];
                  if (sets.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*0.5,
                      child: Column(
                        children: [
                          Spacer(),
                          Center(
                            child: Container(
                              width: 200,
                              child: InfoText(
                                text: 'Tap on Create New to start creating flashcard sets',
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      for (var set in sets)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FlashcardsPage()));
                          },
                          child: FlashcardTile(name: set['name'], noOfCards: set['noOfCards']),
                        )
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator(color: AppColors.greenColor,),);
              },
            )
          ],
        ),
      ),
    );
  }
}
