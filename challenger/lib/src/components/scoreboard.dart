import 'package:challenger/src/models/player_move.dart';
import 'package:flutter/material.dart';

class Scoreboard extends StatefulWidget {
  final String playerName;
  final int counter;
  final Player player;

  Scoreboard({
    Key key,
    @required this.counter,
    @required this.playerName,
    @required this.player,
  }) : super(key: key);

  @override
  _ScoreboardState createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$image.png'),
              fit: BoxFit.fill,
            ),
          ),
          height: 30,
          width: 30,
        ),
        Flexible(
          child: Container(
            child: Text(
              widget.playerName.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Text(
          widget.counter.toString(),
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  String get image {
    String _image;
    if (widget.player == Player.PLAYER_1) {
      _image = 'user1';
    } else if (widget.player == Player.PLAYER_2) {
      _image = 'user2';
    } else {
      _image = 'tied';
    }
    return _image;
  }
}
