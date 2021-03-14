import 'package:challenger/src/mainMenu.dart';
import 'package:challenger/src/moves.dart';
import 'package:challenger/src/onePlayer.dart';
import 'package:flutter/material.dart';

class PlayAgain extends StatelessWidget {
  final WinnerMove winnerPlayer;
  final String nameWinnerPlayer;
  const PlayAgain({
    @required this.nameWinnerPlayer,
    @required this.winnerPlayer,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String roundWinner;
    String stateGameImage;

    if (winnerPlayer == WinnerMove.MOVE_1) {
      stateGameImage = 'ganhou';
      roundWinner = ('$nameWinnerPlayer!');
    } else if (winnerPlayer == WinnerMove.MOVE_2) {
      stateGameImage = 'ganhou';
      roundWinner = 'Robô!';
    } else {
      stateGameImage = 'tied';
      roundWinner = 'Empatou!';
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/ringue.png',
            ),
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/$stateGameImage.png'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                '$roundWinner',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainMenu()));
                        },
                        child: Image.asset('assets/voltar.png'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(MaterialPageRoute(builder: (context) => OnePlayer()));
                        },
                        child: Image.asset('assets/reload.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
