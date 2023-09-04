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
          FloatingNavbarItem(customWidget: SvgPicture.asset('assets/food.svg', color: currIdx == 0 ? Colors.white : Colors.black, height: 22, width: 22,)),
          FloatingNavbarItem(customWidget: Icon(Icons.favorite_border_outlined, color: currIdx == 1 ? Colors.white : Colors.black, size: 22,)),
          FloatingNavbarItem(customWidget: Image.asset('assets/flashcard.png', color: currIdx == 2 ? Colors.white : Colors.black, height: 26, width: 26,)),
        ],
      ),
    );
  }
}
