import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interiit_prep/features/foodtech/components/doctorCard.dart';
import 'package:interiit_prep/features/foodtech/components/infoText.dart';
import 'package:interiit_prep/features/foodtech/detailsPage.dart';
import 'package:interiit_prep/shared/textWidgets.dart';

import '../../shared/appColors.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({
    Key? key,
    required this.type,
}) : super(key: key);

  final String type;

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {



  Future<List> getDoctors() async {
    List doctors = [];
    var db = FirebaseFirestore.instance;
    String type = widget.type.trim().toLowerCase();
    await db.collection('doctors').where('specialization', isEqualTo: type).get().then((event) {
      for (var doc in event.docs) {
        doctors.add(doc.data());
      }
    });
    return doctors;
  }

  @override
  Widget build(BuildContext context) {
    getDoctors();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: MediumText(text: 'Available Doctors')),
              SizedBox(height: 20,),
              FutureBuilder(
                future: getDoctors(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // todo: error text
                      return Text('Error');
                    }
                    List doctors = snapshot.data ?? [];
                    if (doctors.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              width: 200,
                              child: InfoText(
                                text: 'Oops! No such doctors available at the moment',
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var doctor in doctors)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(name: doctor['name'], desc: doctor['specialization'], availability: doctor['availability'], image: doctor['image'])));
                            },
                            child: DoctorCard(name: doctor['name'], desc: doctor['specialization'], availability: doctor['availability'], image: doctor['image'].isNotEmpty ? doctor['image'] : 'assets/avatar.png'),
                          ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
