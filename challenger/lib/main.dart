import 'package:audioplayers/audio_cache.dart';
import 'package:challenger/src/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/presentation.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Info(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  static AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    final player = AudioCache();
    player.loop('king.mp3', volume: 0.3);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      home: Presentation(),
    );
  }
}
