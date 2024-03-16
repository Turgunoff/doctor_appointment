//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../auth/sign_up_screen/models/signUpModel.dart';
import '../../user_details_screen/user_details_screen.dart';
import '../models/doctors.dart';

class HomeController extends GetxController {
  Rx<User?> user = Rx(null);
  RxBool isLoading = true.obs;
  RxString greeting = 'Good Morning'.obs;

  final RxList<Doctor> popularDoctors = RxList<Doctor>([]);

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    user.bindStream(_auth.authStateChanges()); // Stream for auth state
    _updateGreeting();
    Timer.periodic(const Duration(minutes: 1), (_) => _updateGreeting());
    fetchPopularDoctors();
  }

  Future<void> fetchPopularDoctors() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('userDoctors')
          .orderBy('totalRating', descending: true)
          .limit(3)
          .get();

      final doctors = querySnapshot.docs
          .map((doc) => Doctor.fromFirestore(doc.data()))
          .where((doctor) => doctor.userName != null)
          .toList();

      popularDoctors.value = doctors;
      print('Popular Doctors fetched: ${popularDoctors.length}');
    } catch (error) {
      print('Error fetching popular doctors: $error');
    }
  }

  void onPopularDoctorTap(int index) {
    final Doctor doctor = popularDoctors[index];
    Get.toNamed('/userDetailsScreen', // Named route from step 1
        arguments: doctor);
  }
}
