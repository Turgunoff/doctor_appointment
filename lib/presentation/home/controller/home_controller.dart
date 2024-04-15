//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:doctor/main.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/category_model.dart';
import '../models/doctors.dart';

class HomeController extends GetxController {
  // Rx<User?> user = Rx(null);
  RxBool isLoading = true.obs;
  RxString greeting = 'Good Morning'.obs;

  final RxList<Doctor> popularDoctors = RxList<Doctor>([]);
  RxList<CategoryModel> categories = RxList<CategoryModel>();

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greeting.value = 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      greeting.value = 'Good Afternoon';
    } else {
      greeting.value = 'Good Evening';
    }
  }

  @override
  void onInit() {
    super.onInit();
    _updateGreeting();
    Timer.periodic(const Duration(minutes: 1), (_) => _updateGreeting());
    fetchCategories();
  }

  @override
  onReady() {
    super.onReady();
    isLoading.value = false;
  }

  Future<void> fetchCategories() async {
    final data = await supabase
        .from('categories')
        .select('*')
        .eq('doctors.category_id', 'categories.category_id');

    List<CategoryModel> categoriesList = data
        .map((categoryData) => CategoryModel.fromJson(categoryData))
        .toList();
    categories.assignAll(categoriesList);
  }
}
