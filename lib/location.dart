import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class location {
  double latitude = 0.0;
  double longitude = 0.0;
  Future getcurrentlocation() async {
    // LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
  }
}
// double temperature = decode['main']['temperature'];
// int condition = decode['weather'][0]['id'];
// String cityname = decode['name'];
