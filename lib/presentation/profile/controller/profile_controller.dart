//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:doctor/generated/assets.dart';
import 'package:doctor/widgets/custom_button.dart';
import 'package:doctor/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../main.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final _client = Supabase.instance.client;
  RxString fullName = ''.obs;
  RxString paymentId = ''.obs;
  RxInt balance = 0.obs;
  RxString avatarUrl = ''.obs;
  RxBool isOnline = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await _fetchClientData();
  }

  Future<void> _fetchClientData() async {
    final userId = _client.auth.currentUser?.id;

    if (userId == null) {
      print('User is not logged in');
      return;
    }
    final steamData = await _client
        .from('clients')
        .select('full_name, payment_id, balance, avatar_url')
        .eq('id', userId)
        .asStream();

    // Извлекаем данные
    steamData.listen((data) {
      if (data.isNotEmpty) {
        final clientData = data.first;
        fullName.value = clientData['full_name'] ?? '';
        paymentId.value = clientData['payment_id'] ?? '';
        balance.value = clientData['balance'] ?? 0;
        avatarUrl.value = clientData['avatar_url'] ?? '';
      }
    });
  }

  void logOut() async {
    try {
      Get.defaultDialog(
        title: 'Log Out',
        middleText: 'Are you sure you want to log out?',
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        buttonColor: Colors.red,
        confirm: CustomButton(
            height: 50,
            width: double.infinity,
            textButton: 'Yes',
            color: Colors.red,
            onPressed: () async {
              Get.back(); // Скрываем диалог
              Get.dialog(const Center(child: CircularProgressIndicator()),
                  transitionDuration:
                      const Duration(seconds: 5000)); // Индикатор
              await supabase.auth.signOut();
              Get.offAllNamed(AppRoutes.navigationPage); // Переход
            }),
        cancel: CustomButton(
          height: 50,
          width: double.infinity,
          textButton: 'Cancel',
          onPressed: () => Get.back(),
        ),
      );
    } on AuthException catch (e) {
      Get.snackbar('Logout Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }
}
