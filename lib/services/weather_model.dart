import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_clima/services/networking.dart';
import '../screens/location.dart';
import '../services/location.dart';

class WeatherModel {
  final String _key = 'bc68cc0cf6fd3ec141057a18459720ba';
  final String url = 'https://api.openweathermap.org/data/2.5/weather?';

  Future<dynamic> getCityData(String cityName, BuildContext context) async {
    var weatherInfo = await NetWorkingService(
            '${url}q=${cityName}&appid=$_key&units=imperial')
        .getWeatherData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: weatherInfo,
                )));
  }

  void getLocationData(BuildContext context) async {
    Location location = Location();
    await location.getCurrentLocation();
    var weatherInfo = await NetWorkingService(
            '${url}lat=${location.latitude}&lon=${location.longitude}&appid=$_key&units=imperial')
        .getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherInfo,
        ),
      ),
    );
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 80) {
      return 'It\'s 🍦 time';
    } else if (temp > 60) {
      return 'Time for shorts and 👕';
    } else if (temp < 30) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
