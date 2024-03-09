//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/my_booking_controller.dart';

class MyBookingScreen extends GetView<MyBookingController> {
  const MyBookingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои бронирования'),
      ),
      body: Center(
        child: Text('Мои бронирования'),
      ),
    );
  }
}
