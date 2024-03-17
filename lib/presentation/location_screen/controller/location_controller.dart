//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:get/get.dart';

import '../../../services/yandex_map_service.dart';

class LocationController extends GetxController {
  final _locationService = LocationService();
  Rx<AppLatLong> currentLocation = const AppLatLong(lat: 0, long: 0).obs;

  @override
  void onInit() {
    super.onInit();
    _initPermission();
  }

  Future<void> _initPermission() async {
    if (!await _locationService.checkPermission()) {
      await _locationService.requestPermission();
    }
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      final location = await _locationService.getCurrentLocation();
      currentLocation.value = location;
    } catch (e) {}
  }

  void updateCurrentLocation() async {
    try {
      final updatedLocation = await _locationService.getCurrentLocation();
      currentLocation.value = updatedLocation;
    } catch (e) {
      // Handle error
    }
  }

  void setDefaultLocation() {
    currentLocation.value = const TashkentLocation();
  }
}
