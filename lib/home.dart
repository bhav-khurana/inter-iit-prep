import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interiit_prep/features/edTech/edTechScreenn.dart';
import 'package:interiit_prep/features/foodtech/foodTechScreen.dart';
import 'package:interiit_prep/features/healthtech/healthTechScreen.dart';
import 'package:interiit_prep/shared/appColors.dart';

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
      bottomNavigationBar: FloatingNavbar(
        margin: const EdgeInsets.all(16),
        backgroundColor: AppColors.greenColor,
        selectedBackgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: currIdx,
        onTap: (index) => setState(() => currIdx = index),
        items: [
          FloatingNavbarItem(customWidget: Image.asset('assets/calorieIcon.png', color: currIdx == 0 ? Colors.white : Colors.black, height: 25, width: 25,)),
          FloatingNavbarItem(customWidget: Image.asset('assets/stetho.png', color: currIdx == 1 ? Colors.white : Colors.black, height: 22, width: 22,)),
          FloatingNavbarItem(customWidget: Image.asset('assets/flashcard.png', color: currIdx == 2 ? Colors.white : Colors.black, height: 23, width: 23,)),
        ],
      ),
    );
  }
}
