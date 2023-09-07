import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interiit_prep/features/edTech/edTechScreenn.dart';
import 'package:interiit_prep/features/foodtech/foodTechScreen.dart';
import 'package:interiit_prep/features/healthtech/healthTechScreen.dart';
import 'package:interiit_prep/shared/appColors.dart';
import 'package:interiit_prep/shared/customNavBar.dart';

class Home extends StatefulWidget {
  const Home({
    required this.page,
    Key? key,
  }) : super(key: key);

  final int page;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static int currIdx = 0;
  List<Widget> pages = [
    const HealthTechScreen(),
    const FoodTechScreen(),
    const EdTechScreen(),
  ];

  updateIdx(int idx) {
    currIdx = idx;
    setState(() {});
  }

  @override
  void initState() {
    currIdx = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      body: pages[currIdx],
      bottomNavigationBar: CustomNavBar(color: AppColors.greenColor, imageList: const [
        'assets/calorieIcon.png',
        'assets/stetho.png',
        'assets/flashcard.png',
      ], currIdx: currIdx, updateIdx: updateIdx),
    );
  }
}
