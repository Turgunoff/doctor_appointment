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
  final RxList<CategoryModel> categories = RxList<CategoryModel>();

  final _categories = <CategoryModel>[].obs;

  List<CategoryModel> get categories => _categories.toList();

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

  Future<List<CategoryModel>> getCategories(String? filter) async {
    final query = supabase.from('categories').select('id,name,image_url');

    late PostgrestResponse response;

    if (filter == null || filter.isEmpty) {
      response = await query.execute();
    } else {
      response = await query.textSearch('name', '$filter%').execute();
    }

    final error = response.error;

    if (error != null && response.status != 406) {
      throw Exception(error.message);
    }

    if (response.data != null) {
      return (response.data as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    }
    throw Exception('Failed to get categories');
    return await getCategories(filter);
  }

  // void onPopularDoctorTap(int index) {
  //   final Doctor doctor = popularDoctors[index];
  //   Get.toNamed('/userDetailsScreen', // Named route from step 1
  //       arguments: doctor);
  // }
}
