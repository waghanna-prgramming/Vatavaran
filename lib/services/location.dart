import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      double latitude = position.latitude;
      double longitude = position.longitude;
      // print('Latitude: $latitude longitude: $longitude');
    } catch (e) {
      print('Permission to access location denied');
    }
  }
}
