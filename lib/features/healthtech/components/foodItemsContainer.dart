import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interiit_prep/features/healthtech/components/inputField.dart';
import 'package:interiit_prep/features/healthtech/components/itemTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List items = [];

  Future<void> setItemList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    items = jsonDecode(prefs.getString('${widget.foodType}ItemList') ?? jsonEncode([]));

  }

  Future<void> addItemToList(String item, String quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    items = jsonDecode(prefs.getString('${widget.foodType}ItemList') ?? jsonEncode([]));
    items.add([item, quantity]);
    await prefs.setString('${widget.foodType}ItemList', jsonEncode(items));
  }

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
          FutureBuilder(
            future: setItemList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('Error'),);
                }
                return Column(
                  children: [
                    for (var item in items)
                      ItemTile(item: item[0], quantity: item[1]),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),


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
              IconButton(icon: Icon(Icons.add, color: AppColors.greenColor,), onPressed: () async {

                await addItemToList(newItemController.text, newQuantityController.text);
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
