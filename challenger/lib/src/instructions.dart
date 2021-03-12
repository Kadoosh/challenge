import 'package:challenger/src/nameCollect.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return _loading();
  }
}

Widget _loading() {
  return Stack(
    children: [
      SplashScreen(
        seconds: 4,
        navigateAfterSeconds: CollectName(),
        backgroundColor: Colors.black87,
        loaderColor: Colors.black,
        useLoader: false,
        loadingText: Text(
          'Carregando...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/loading.png'),
          ),
        ),
      ),
    ],
  );
}
