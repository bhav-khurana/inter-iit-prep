import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.color,
    required this.imageList,
    required this.currIdx,
    required this.updateIdx,
  }) : super(key: key);

  final Color color;
  final List<String> imageList;
  final int currIdx;
  final Function(int) updateIdx;

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      margin: EdgeInsets.all(16),
      backgroundColor: color,
      selectedBackgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: currIdx,
      onTap: (index) {
        updateIdx(index);
      },
      items: [
        for (int i = 0; i < imageList.length; i++)
          FloatingNavbarItem(customWidget: Image.asset(imageList[i], color: currIdx == i ? Colors.white : Colors.black, height: 23, width: 23,)),
      ],
    );
  }
}
