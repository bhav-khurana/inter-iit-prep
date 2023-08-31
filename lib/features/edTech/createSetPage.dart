import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:interiit_prep/features/foodtech/components/endButton.dart';
import 'package:interiit_prep/features/foodtech/components/infoText.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/textWidgets.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateSetPage extends StatefulWidget {
  const CreateSetPage({Key? key}) : super(key: key);

  @override
  State<CreateSetPage> createState() => _CreateSetPageState();
}

class _CreateSetPageState extends State<CreateSetPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController noOfCardsController = TextEditingController();

  bool loading = false;

  Future<File> chooseFiles() async {
    setState(() {
      loading = true;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      PDFDoc doc = await PDFDoc.fromFile(file);
      String docText = await doc.text;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'flashcardSet ${nameController.text} text', docText);
      await prefs.setInt('flashcardSet ${nameController.text} noOfCards', int.parse(noOfCardsController.text));
      List<String> sets = prefs.getStringList('flashcardSets') ?? [];
      sets.add(nameController.text);
      await prefs.setStringList('flashcardSets', sets);
      setState(() {
        loading = false;
      });
      Navigator.pop(context);
      return file;
    } else {
      return File('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(text: 'Create Set'),
              SizedBox(height: 40,),
              MediumText(text: 'Enter set name'),
              InputField(controller: nameController, hint: 'e.g. Anatomy, Compounds'),
              SizedBox(height: 30,),
              MediumText(text: 'Enter expected number of Flashcards'),
              InputField(controller: noOfCardsController, hint: 'e.g. 3, 10'),
              SizedBox(height: 30,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    chooseFiles();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0.7, color: Colors.grey)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.upload,
                            color: Colors.grey,
                          ),
                          InfoText(text: 'Tap to upload PDF')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              EndButton(text: 'Create Set', color: AppColors.greenColor)
            ],
          ),
        ),
      ),
    );
  }
}
