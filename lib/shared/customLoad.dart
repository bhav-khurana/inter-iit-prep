import 'package:flutter/material.dart';

import '../features/foodtech/components/infoText.dart';
import 'appColors.dart';

class CustomLoad extends StatelessWidget {
  const CustomLoad({
    Key? key,
    this.text,
    required this.color,
  }) : super(key: key);

  final String? text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: CircularProgressIndicator(color: color,)),
        SizedBox(height: 12,),
        Center(child: InfoText(text: text ?? '',),),
      ],
    );
  }
}
