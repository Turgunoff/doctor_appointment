//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';
import 'dart:ui';

import 'package:doctor/services/yandex_map_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'controller/location_controller.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with AutomaticKeepAliveClientMixin {
  final mapControllerCompleter = Completer<YandexMapController>();
  final _locationController = Get.put(LocationController());

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 3),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 14,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //width and height of the screen
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withAlpha(100),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(100),
        title: const Text('Doctor Details'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
              _locationController.setDefaultLocation();
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () => _moveToCurrentLocation(
                  _locationController.currentLocation.value),
              backgroundColor: Colors.white,
              child: const Icon(Icons.my_location),
            ),
          ),
          const Center(
            child: Icon(
              Icons.location_on,
              size: 36,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
