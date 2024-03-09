//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/explore_controller.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Исследовать'),
      ),
      body: Center(
        child: Text('Исследовать'),
      ),
    );
  }
}
