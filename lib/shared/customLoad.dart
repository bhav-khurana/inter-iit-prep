import 'package:flutter/material.dart';

import '../features/foodtech/components/infoText.dart';
import 'appColors.dart';

class CustomLoad extends StatelessWidget {
  const CustomLoad({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: CircularProgressIndicator(color: AppColors.greenColor,)),
        SizedBox(height: 12,),
        Center(child: InfoText(text: text ?? '',),),
      ],
    );
  }
}
