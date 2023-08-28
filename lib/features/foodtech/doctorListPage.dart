import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/detailsPage.dart';
import 'package:interiit_prep/shared/textWidgets.dart';

import '../../shared/appColors.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {

  List names = ['Name1', 'Name2', 'Name3', 'Name4', 'Name5',];
  List avatars = ['avatar.png','avatar.png','avatar.png','avatar.png','avatar.png',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 12),
          child: Column(
            children: [
              MediumText(text: 'Available Doctors'),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const DetailsPage()));
                      },
                      child: ListTile(
                        minVerticalPadding: 25,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${avatars[index]}'),
                        ),
                        title: Text(
                          names[index],
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryBlackColor
                              )
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
