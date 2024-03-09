//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:get/get.dart';

import '../controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
