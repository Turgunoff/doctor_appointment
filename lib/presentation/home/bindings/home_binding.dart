//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}