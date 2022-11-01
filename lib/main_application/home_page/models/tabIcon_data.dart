import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/others/nutrition_light.png',
      selectedImagePath: 'assets/others/nutrition_navy.png',
      index: 0,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/others/clock_light.png',
      selectedImagePath: 'assets/others/clock_navy.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/others/calc_light.png',
      selectedImagePath: 'assets/others/calc_navy.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/others/search_light.png',
      selectedImagePath: 'assets/others/search_navy.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
