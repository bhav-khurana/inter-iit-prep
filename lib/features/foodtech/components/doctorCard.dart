import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/appColors.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.name,
    required this.desc,
    required this.availability,
    required this.image,
  }) : super(key: key);

  final String name, desc, availability, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
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
                name,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: AppColors.primaryBlackColor
                    )
                ),
              ),
              const SizedBox(height: 4,),
              Text(
                desc,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 13,
                        color: AppColors.infoGreyColor
                    )
                ),
              ),
              Text(
                availability,
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
              // await _makePhoneCall(7087341267);
            },
          )
        ],
      ),
    );
  }
}
