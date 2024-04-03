//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:get/get.dart';

import '../models/category_model.dart';
import '../models/doctors.dart';

class HomeController extends GetxController {
  // Rx<User?> user = Rx(null);
  RxBool isLoading = true.obs;
  RxString greeting = 'Good Morning'.obs;

  final RxList<Doctor> popularDoctors = RxList<Doctor>([]);

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    // user.bindStream(_auth.authStateChanges()); // Stream for auth state
    _updateGreeting();
    Timer.periodic(const Duration(minutes: 1), (_) => _updateGreeting());
    // fetchPopularDoctors();
  }

  @override
  onReady() {
    super.onReady();
    isLoading.value = false;
    // fetchCategories();

  }

  // Future<void> fetchPopularDoctors() async {
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('userDoctors')
  //         .orderBy('totalRating', descending: true)
  //         .limit(3)
  //         .get();
  //
  //     final doctors = querySnapshot.docs
  //         .map((doc) => Doctor.fromFirestore(doc.data()))
  //         .where((doctor) => doctor.userName != null)
  //         .toList();
  //
  //     popularDoctors.value = doctors;
  //     print('Popular Doctors fetched: ${popularDoctors.length}');
  //   } catch (error) {
  //     print('Error fetching popular doctors: $error');
  //   }
  // }
  //
  // Future<void> fetchCategories() async {
  //   try {
  //     final snapshot = await _firestore.collection('categories').get();
  //     categories.value = snapshot.docs
  //         .map((doc) => CategoryModel.fromFirestore(doc.data()))
  //         .toList();
  //   } catch (e) {
  //     // Handle error (e.g., display a snackbar)
  //   }
  // }

  void onPopularDoctorTap(int index) {
    final Doctor doctor = popularDoctors[index];
    Get.toNamed('/userDetailsScreen', // Named route from step 1
        arguments: doctor);
  }
}
