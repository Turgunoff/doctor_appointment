//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:get/get.dart';

class NavigationController extends GetxController {

  int tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

}