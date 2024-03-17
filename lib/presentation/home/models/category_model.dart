//
// @Author: "Eldor Turgunov"
// @Date: 31.01.2024
//


class CategoryModel {
  final String categoryName;

  CategoryModel({required this.categoryName});

  factory CategoryModel.fromFirestore(Map<String, dynamic> snapshot) {
    return CategoryModel(
      categoryName: snapshot['categoryName'] ?? '',
    );
  }

}
