import 'package:challenger/src/presentation.dart';
import 'package:flutter/material.dart';

class OnePlayer extends StatefulWidget {
  @override
  _OnePlayerState createState() => _OnePlayerState();
}

class _OnePlayerState extends State<OnePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
