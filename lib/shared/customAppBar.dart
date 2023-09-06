import 'package:flutter/material.dart';
import 'package:interiit_prep/shared/textWidgets.dart';

import 'appColors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: MediumText(text: title),
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primaryBlackColor,
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(width: 30, height: 30, child: Icon(Icons.arrow_back_ios, size: 18,)),
      ),
      centerTitle: true,
    );
  }
}
