import 'package:flutter/material.dart';

ColorScheme kColorScheme = ColorScheme.fromSwatch(primarySwatch: kcustomBlue);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(12.9),
    ),
  ),
  hintText: "Enter City name here",
  filled: true,
  fillColor: Color(0xb8ffffff),
  icon: Icon(Icons.location_city_sharp),
);

MaterialColor kcustomBlue = const MaterialColor((0xFF5399B9), {
  600: Color(0xFF5399b9),
  500: Color(0xFF5ba6c6),
  400: Color(0xFF66b3cd),
  300: Color(0xFF76c0d5),
  200: Color(0xFF93d2e1),
  100: Color(0xFFbbe4ec),
  50: Color(0xFFb97353),
});
