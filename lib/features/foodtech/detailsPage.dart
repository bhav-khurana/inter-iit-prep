import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/components/doctorCard.dart';
import 'package:interiit_prep/features/foodtech/components/endButton.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/textWidgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.name,
    required this.desc,
    required this.availability,
    required this.image,
}) : super(key: key);

  final String name, desc, availability, image;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  String appointmentDate = 'Tomorrow (29 Aug)';

  _makePhoneCall(int phoneNo) async {
    var url = Uri.parse('tel:$phoneNo');
    await launchUrl(url);
  }

  TextEditingController nameController =
  TextEditingController();
  TextEditingController commentController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    var val = DateTime.parse('2022-12-27 09:00:00');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MediumText(text: 'Book Appointment'),
              SizedBox(height: 16,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  // border: Border.all(width: 0.4),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: Center(
                  child: DropdownButton(
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: AppColors.primaryBlackColor
                    ),
                    dropdownColor: Colors.white,
                    // focusColor: Colors.white,
                    isExpanded: true,
                    itemHeight: null,
                    value: appointmentDate,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ['Tomorrow (29 Aug)', '30 Aug', '31 Aug'].map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryBlackColor
                              )
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        appointmentDate = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 14,),
              DoctorCard(name: widget.name, desc: widget.desc, availability: widget.availability, image: widget.image.isNotEmpty ? widget.image : 'assets/avatar.png',),
              const SizedBox(height: 8,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InputField(controller: nameController, hint: 'Enter Patient Name'),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InputField(controller: commentController, hint: 'Any Comments you want to add'),
              ),
              const SizedBox(height: 20,),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListWheelScrollView(
                            clipBehavior: Clip.antiAlias,
                            diameterRatio: 80,
                            physics: const FixedExtentScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            useMagnifier: true,
                            magnification: 1.1,
                            itemExtent: 60,
                            children: [
                              Center(
                                child: Text('-- Choose Slot --', style: GoogleFonts.lato(
                                    fontSize: 19,
                                    color: AppColors.primaryBlackColor
                                ),),
                              ),
                              for (int i = 1; i <= 20; i++)
                                Row(
                                  children: [
                                    // const SizedBox(width: 137,),
                                    SizedBox(width: 20,),
                                    Text('$i ', style: GoogleFonts.lato(
                                        fontSize: 19,
                                      color: AppColors.primaryBlackColor
                                    ),),
                                    const Spacer(),
                                    Text('${DateFormat.jm().format((val=val.add(const Duration(minutes: 15))))} - ${DateFormat.jm().format(val.add(const Duration(minutes: 15)))}',
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: AppColors.primaryBlackColor,
                                    ),),
                                    SizedBox(width: 20,),
                                  ],
                                )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              EndButton(text: 'Pay Now', color: AppColors.greenColor),
              const SizedBox(height: 10,),
              EndButton(text: 'Pay at Hospital', color: AppColors.greenColor),
            ],
          ),
        ),
      ),
    );
  }
}
