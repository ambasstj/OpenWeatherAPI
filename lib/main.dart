import 'package:flutter/material.dart';
import 'package:real_clima/screens/location.dart';
import 'screens/color_pallate.dart';
import 'constants/constants.dart';
import 'screens/home_page.dart';
import 'screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/Home': (context) => const LocationScreen(),
        '/pallate': (context) => const ColorPallate()
      },
      theme: ThemeData.from(colorScheme: kColorScheme),
    );
  }
}
