import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Location {
  double? longitude;
  double? latitude;
  String key = 'bc68cc0cf6fd3ec141057a18459720ba';

  Future<void> makeRequest() async {
    Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${key}'));
    // data/response.body returns as a string
    var data = response.body;
    //we decode the string into a Json Format so that we can retrieve relevant info
    //The Json format is essentially a Dictionary/'Map'
    var decodedData = jsonDecode(data);

    String description = decodedData['weather'][0]['description'];
    double temp = decodedData['main']['temp'];
    int id = decodedData['weather'][0]['id'];
    String cityName = decodedData['name'];

    print(temp);
    print(description);
    print(id);
    print(cityName);
  }

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
