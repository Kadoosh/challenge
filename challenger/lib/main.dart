import 'package:challenger/src/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/presentation.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Info(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
