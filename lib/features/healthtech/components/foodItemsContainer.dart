import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/features/healthtech/components/itemTile.dart';

import '../../../shared/appColors.dart';

class FoodItemsContainer extends StatefulWidget {
  const FoodItemsContainer({Key? key, required this.foodType}) : super(key: key);

  final String foodType;

  @override
  State<FoodItemsContainer> createState() => _FoodItemsContainerState();
}

class _FoodItemsContainerState extends State<FoodItemsContainer> {

  TextEditingController newItemController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  List items = [
    ['Rice', '2 bowls'],
    ['Milk', '3 cups'],
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(14),
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.foodType,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryBlackColor,
                fontWeight: FontWeight.bold
              ),
            ),
            textAlign: TextAlign.center,
          ),
          Divider(height: 18, thickness: 1,),

          // todo: List
          for (var item in items)
            ItemTile(item: item[0], quantity: item[1]),

          Row(
            children: [
              SizedBox(
                width: screenWidth*0.3,
                child: InputField(controller: newItemController, hint: 'Add Item'),
              ),
              Spacer(),
              SizedBox(
                width: screenWidth*0.3,
                child: InputField(controller: newQuantityController, hint: 'Add Quantity'),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.add, color: AppColors.greenColor,), onPressed: (){

                items.add([newItemController.text, newQuantityController.text]);
                newItemController.text = '';
                newQuantityController.text = '';
                setState(() {});

              },)
            ],
          )
        ],
      ),
    );
  }
}
