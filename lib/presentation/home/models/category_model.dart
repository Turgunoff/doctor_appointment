//
// @Author: "Eldor Turgunov"
// @Date: 31.01.2024
//

class CategoryModel {
  final String nameRu;
  final String nameUz;
  final String imageUrl;
  final int doctorCount;

  CategoryModel({
    required this.nameRu,
    required this.nameUz,
    required this.imageUrl,
    required this.doctorCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      nameRu: json['name_ru'] as String,
      nameUz: json['name_uz'] as String,
      imageUrl: json['image_url'] as String,
      doctorCount: json['doctor_count'] as int,
    );
  }
}
