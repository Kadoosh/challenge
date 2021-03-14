import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'mainMenu.dart';

class Presentation extends StatefulWidget {
  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  Widget build(BuildContext context) {
    return _presentation();
  }
}

Widget _presentation() {
  return Stack(
    children: [
      SplashScreen(
        seconds: 2,
        navigateAfterSeconds: MainMenu(),
        backgroundColor: Colors.black87,
        useLoader: false,
      ),
      Container(
        child: Image(image: AssetImage("assets/presentation.png")),
      ),
    ],
  );
}
