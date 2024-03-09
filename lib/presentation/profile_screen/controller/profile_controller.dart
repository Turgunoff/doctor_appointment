//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  var selectedLanguage = 'en_US'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void _loadLanguage() {
    if (box.hasData('language')) {
      selectedLanguage(box.read('language'));
    }
  }

  void changeLanguage(String languageCode) {
    selectedLanguage(languageCode);
    box.write('language', languageCode);
    Get.updateLocale(Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
    Get.back();
  }
}