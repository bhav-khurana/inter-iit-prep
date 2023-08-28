import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/foodtech/components/endButton.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/textWidgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  String appointmentDate = 'Tomorrow (27 Dec)';

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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              MediumText(text: 'Book Appointment'),
              SizedBox(height: 16,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: DropdownButton(
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: AppColors.primaryBlackColor
                    ),
                    isExpanded: true,
                    itemHeight: null,
                    value: appointmentDate,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ['Tomorrow (27 Dec)', '28 Dec', '29 Dec'].map((String item) {
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
              const SizedBox(height: 18,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/avatar.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr Anil Gupta',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 17,
                                    color: AppColors.primaryBlackColor
                                )
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            'Skin Specialist (MBBS, MD)',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.infoGreyColor
                                )
                            ),
                          ),
                          Text(
                            '9am - 5pm',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.infoGreyColor
                                )
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.call, color: AppColors.greenColor,),
                        onPressed: () async {
                          await _makePhoneCall(7087341267);
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InputField(controller: nameController, hint: 'Enter Patient Name'),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InputField(controller: nameController, hint: 'Any Comments you want to add'),
              ),
              const SizedBox(height: 20,),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: ListWheelScrollView(
                            clipBehavior: Clip.antiAlias,
                            diameterRatio: 80,
                            physics: const FixedExtentScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            useMagnifier: true,
                            magnification: 1,
                            itemExtent: 50,
                            children: [
                              for (int i = 1; i <= 20; i++)
                                Row(
                                  children: [
                                    // const SizedBox(width: 137,),
                                    Text('$i ', style: GoogleFonts.lato(
                                        fontSize: 19,
                                      color: AppColors.primaryBlackColor
                                    ),),
                                    const Spacer(),
                                    Text('${DateFormat.jm().format((val=val.add(const Duration(minutes: 15))))} to ${DateFormat.jm().format(val.add(const Duration(minutes: 15)))}', style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: AppColors.primaryBlackColor,
                                    ),)
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
