import 'package:challenger/src/screens/name_collect.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
