import 'package:challenger/src/moves.dart';
import 'package:flutter/material.dart';

class StandardButtom extends StatefulWidget {
  final Move move;
  final Function(Move) onPressButton;
  final int invisibleButtom;

  StandardButtom({
    Key key,
    @required this.onPressButton,
    @required this.move,
    @required this.invisibleButtom,
  }) : super(key: key);

  @override
  _StandardButtomState createState() => _StandardButtomState();
}

class _StandardButtomState extends State<StandardButtom> {
  @override
  Widget build(BuildContext context) {
    String imageName;

    if (widget.move == Move.ROCK) {
      imageName = 'pedra';
    } else if (widget.move == Move.PAPER) {
      imageName = 'papel';
    } else {
      imageName = 'tesoura';
    }

    if (widget.invisibleButtom != 3) {
      return SizedBox(
        height: 90,
        width: 90,
        child: ElevatedButton(
          onPressed: null,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/attention.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: SizedBox(
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onPressButton(widget.move);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/$imageName.png'),
                          fit: BoxFit.scaleDown,
                        ),
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
  }
}
