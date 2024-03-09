//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;

  final RxList<CategoryModel> categoryData = <CategoryModel>[
    CategoryModel(categoryName: 'All', isSelected: true),
    CategoryModel(categoryName: 'Barber', isSelected: false),
    CategoryModel(categoryName: 'Hair', isSelected: false),
    CategoryModel(categoryName: 'Nail', isSelected: false),
    CategoryModel(categoryName: 'Makeup', isSelected: false),
    CategoryModel(categoryName: 'Massage', isSelected: false),
    CategoryModel(categoryName: 'Face', isSelected: false),
    CategoryModel(categoryName: 'Body', isSelected: false),
    CategoryModel(categoryName: 'Spa', isSelected: false),
    CategoryModel(categoryName: 'Waxing', isSelected: false),
    CategoryModel(categoryName: 'Tattoo', isSelected: false),
    CategoryModel(categoryName: 'Piercing', isSelected: false),
    CategoryModel(categoryName: 'Eyebrows', isSelected: false),
    CategoryModel(categoryName: 'Eyelashes', isSelected: false),
    CategoryModel(categoryName: 'Teeth', isSelected: false),
    CategoryModel(categoryName: 'Tanning', isSelected: false),
    CategoryModel(categoryName: 'Others', isSelected: false),
  ].obs;

  void changeTheme() {
    isDark.value = !isDark.value;
    Get.changeTheme(
      isDark.value ? ThemeData.dark() : ThemeData.light(),
    );
  }

  void selectCategory(int index) {
    for (int i = 0; i < categoryData.length; i++) {
      categoryData[i].isSelected.value = i == index;
      update();
    }
  }
}
