import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'onePlayer.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return _loading();
  }
}

Widget _loading() {
  return Stack(
    children: [
      SplashScreen(
        seconds: 6,
        navigateAfterSeconds: OnePlayer(),
        backgroundColor: Colors.purpleAccent,
        loaderColor: Colors.black,
        useLoader: false,
        loadingText: Text('Carregando...', style: TextStyle(fontSize: 20, color: Colors.black)),
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
