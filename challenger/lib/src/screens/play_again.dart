import 'package:audioplayers/audio_cache.dart';
import 'package:challenger/src/screens/main_menu.dart';

import 'package:challenger/src/screens/one_player.dart';
import 'package:challenger/src/services/winner_move.dart';
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
    winnerSong();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/ring.png',
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainMenu(),
                            ),
                          );
                        },
                        child: Image.asset('assets/return.png'),
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
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) => OnePlayer(
                                player1Name: nameWinnerPlayer,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/reload.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get stateGameImage {
    String _stateGameImage;

    if (winnerPlayer == WinnerMove.MOVE_1) {
      _stateGameImage = 'win';
    } else if (winnerPlayer == WinnerMove.MOVE_2) {
      _stateGameImage = 'win';
    } else {
      _stateGameImage = 'tied';
    }
    return _stateGameImage;
  }

  String get roundWinner {
    String _roundWinner;

    if (winnerPlayer == WinnerMove.MOVE_1) {
      _roundWinner = ('$nameWinnerPlayer!');
    } else if (winnerPlayer == WinnerMove.MOVE_2) {
      _roundWinner = 'Robô!';
    } else {
      _roundWinner = 'Empatou!';
    }
    return _roundWinner;
  }

  void winnerSong() {
    final player = AudioCache();
    player.play('click.mp3');
  }
}
