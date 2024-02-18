import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../main.dart';

class ColorPallate extends StatefulWidget {
  const ColorPallate({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorScheme.onSecondaryContainer,
        title: const Text('Color Pallate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _colorTile('Primary', kColorScheme.primary),
            _colorTile("Secondary", kColorScheme.secondary),
            _colorTile('Background', kColorScheme.background),
            _colorTile('Outline', kColorScheme.outline),
            _colorTile('On Primary', kColorScheme.onPrimary),
            _colorTile('On Primary Container', kColorScheme.onPrimaryContainer),
            _colorTile('Background', kColorScheme.background),
            _colorTile('Inverse Primary', kColorScheme.inversePrimary),
            _colorTile('Inverse Surface', kColorScheme.inverseSurface),
            _colorTile('onSecondary', kColorScheme.onSecondary),
            _colorTile(
                'On Secondary Container', kColorScheme.onSecondaryContainer),
            _colorTile('Primary Container', kColorScheme.primaryContainer),
          ],
        ),
      ),
    );
  }

  Widget _colorTile(String title, Color color) {
    return ListTile(
      shape: const ContinuousRectangleBorder(),
      title: Text(title),
      tileColor: color,
    );
  }
}
