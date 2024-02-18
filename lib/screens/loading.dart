import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:real_clima/services/networking.dart';

import '../services/location.dart';

const String _key = 'bc68cc0cf6fd3ec141057a18459720ba';
var weatherInfo;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    weatherInfo = await NetWorkingService(
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$_key')
        .getWeatherData();
    print(weatherInfo['name']);
  }

  @override
  Widget build(BuildContext context) {
    // _determinePosition();
    getLocationData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
            },
            child: Text('City name is')),
      ),
    );
  }
}
