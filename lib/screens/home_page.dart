import '../services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pallate');
        },
        child: const Icon(Icons.color_lens_outlined),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(),
    );
  }
}
