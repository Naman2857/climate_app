import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:climate_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double long = 0.0;
  double lat = 0.0;
  // var data = '';
  var apikey = 'cf5e5c1282553ea36bc9884bb335a30b';
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    // WeatherModel weathermodel = await WeatherModel();
    var weatherdata = await WeatherModel().getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
