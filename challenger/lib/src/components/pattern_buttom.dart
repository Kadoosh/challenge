import 'package:challenger/src/services/winner_move.dart';
import 'package:flutter/material.dart';

class StandardButtom extends StatefulWidget {
  final Move move;
  final Function(Move) onPressButton;
  final String gameState;

  StandardButtom({
    Key key,
    @required this.onPressButton,
    @required this.move,
    @required this.gameState,
  }) : super(key: key);

  @override
  _StandardButtomState createState() => _StandardButtomState();
}

class _StandardButtomState extends State<StandardButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Container(
          child: Row(
            children: [
              ElevatedButton(
                onPressed: (widget.gameState != 'waiting')
                    ? null
                    : () {
                        widget.onPressButton(widget.move);
                      },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$imageName.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get imageName {
    String _imageName;

    if (widget.move == Move.ROCK) {
      _imageName = 'rock';
    } else if (widget.move == Move.PAPER) {
      _imageName = 'paper';
    } else {
      _imageName = 'scissors';
    }
    return _imageName;
  }
}
