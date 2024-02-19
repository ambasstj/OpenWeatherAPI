import 'package:flutter/material.dart';
import 'package:real_clima/constants/constants.dart';
import 'package:real_clima/screens/city_screen.dart';
import 'package:real_clima/services/weather_model.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.weatherData});

  final dynamic weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  dynamic weatherData;
  String? cityName;
  int? temp;
  WeatherModel weatherModel = WeatherModel();
  String? weatherIcon;
  String? message;

  @override
  void initState() {
    weatherData = widget.weatherData;
    updateUI();
    // TODO: implement initState
    super.initState();
  }

  void updateUI() {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherIcon = "ERROR!";
        message = "unable to get weather data";
        return;
      }
      cityName = weatherData['name'];
      double tempAsDouble = weatherData['main']['temp'];
      temp = tempAsDouble.toInt();
      weatherIcon = weatherModel.getWeatherIcon(temp!);
      message = weatherModel.getMessage(temp!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        WeatherModel weatherModel = WeatherModel();
                        weatherModel.getLocationData(context);
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      /*This will certainly be valuable later. The Navigator.push method returns a Future Datatype that can be pushed or popped onto screens. They can hold little pieces of data very similar to put/getExtra in Java.*/
                      var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CityScreen()));
                      if (typedName != null) {
                        weatherModel =
                            await weatherModel.getCityData(typedName, context);
                      }
                      setState(() {
                        updateUI();
                      });
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
