import 'package:flutter/material.dart';
import 'package:interiit_prep/shared/appColors.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.hint,
}) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greenColor)
        )
      ),
    );
  }
}
