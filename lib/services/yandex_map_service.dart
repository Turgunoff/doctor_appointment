//
// @Author: "Eldor Turgunov"
// @Date: 17.03.2024
//

import 'package:geolocator/geolocator.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}

class LocationService implements AppLocation {
  final defaultLocation = const TashkentLocation();

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(
        lat: value.latitude,
        long: value.longitude,
      );
    }).catchError(
      (error) => defaultLocation,
    );
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError(
          (error) => false,
        );
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError(
          (error) => false,
        );
  }
}

class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class TashkentLocation extends AppLatLong {
  const TashkentLocation({
    super.lat = 55.7522200,
    super.long = 37.6155600,
  });
}
