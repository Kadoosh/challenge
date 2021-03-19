import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main_menu.dart';

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
        seconds: 3,
        navigateAfterSeconds: MainMenu(),
        backgroundColor: Colors.black87,
        useLoader: false,
      ),
      Center(
        child: Image(image: AssetImage("assets/presentation.png")),
      ),
    ],
  );
}
