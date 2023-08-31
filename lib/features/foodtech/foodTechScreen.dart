import 'package:flutter/material.dart';
import 'package:interiit_prep/features/foodtech/doctorListPage.dart';
import 'package:interiit_prep/features/healthtech/infoPage.dart';

class FoodTechScreen extends StatefulWidget {
  const FoodTechScreen({Key? key}) : super(key: key);

  @override
  State<FoodTechScreen> createState() => _FoodTechScreenState();
}

class _FoodTechScreenState extends State<FoodTechScreen> {

  TextEditingController doctorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: InfoPage(question: 'Which doctor you want to book an appointment with?', hint: 'e.g. cardiologist, neurologist', controller: doctorController, buttonText: 'Search for Doctors', func: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorList(type: doctorController.text)));
        },),
      ),
    );
  }
}
