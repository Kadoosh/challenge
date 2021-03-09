import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'menuInicial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        navigateAfterSeconds: HomeScreen(),
        backgroundColor: Colors.blueAccent,
        useLoader: false,
      ),
      Container(
        child: Image(image: AssetImage("assets/presentation.png")),
      ),
    ],
  );
}
