//
// @Author: "Eldor Turgunov"
// @Date: 31.01.2024
//

import 'package:get/get.dart';

class CategoryModel {
  final String categoryName;
  final RxBool isSelected;

  CategoryModel({
    required this.categoryName,
    required bool isSelected,
  }) : isSelected = isSelected.obs;
}
