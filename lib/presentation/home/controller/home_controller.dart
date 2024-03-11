//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../auth/models/userModel.dart';

class HomeController extends GetxController {
  Rx<User?> user = Rx(null);
  RxList<UserModel> users = RxList<UserModel>([]);
  RxBool isLoading = true.obs;
  RxString greeting = 'Good Morning'.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges()); // Stream for auth state
    fetchUsers(); // Optionally fetch users on initialization
    _updateGreeting();
    Timer.periodic(const Duration(minutes: 1), (_) => _updateGreeting());
  }

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

  Future<void> fetchUsers() async {
    try {
      final usersQuery =
          await FirebaseFirestore.instance.collection('userDoctors').get();

      users.value =
          usersQuery.docs.map((doc) => UserModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
