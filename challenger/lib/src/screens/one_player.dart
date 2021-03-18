import 'package:challenger/src/components/pattern_buttom.dart';
import 'package:challenger/src/components/Scoreboard.dart';
import 'package:challenger/src/models/computer_move.dart';
import 'package:challenger/src/models/player_move.dart';
import 'package:challenger/src/screens/main_menu.dart';
import 'package:challenger/src/services/winner_move.dart';
import 'package:challenger/src/screens/play_again.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OnePlayer extends StatefulWidget {
  final String namePlayer1;

  OnePlayer({
    Key key,
    @required this.namePlayer1,
  }) : super(key: key);
  @override
  _OnePlayerState createState() => _OnePlayerState();
}

class _OnePlayerState extends State<OnePlayer> {
  int player1Wins, player2Wins, ties;

  String imageGameStage;

  Move player1Move;
  Move player2Move;
  WinnerMove winner;

  String imagePlayer1;
  String imagePlayer2;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        player1Wins = 0;
        player2Wins = 0;
        ties = 0;
        imageGameStage = 'waiting';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    playsMade();
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MainMenu(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/return.png'),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              height: 90,
                              width: 200,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Scoreboard(
                                      player: Player.PLAYER_1,
                                      counter: player1Wins,
                                      namePlayer: '${widget.namePlayer1}: ',
                                    ),
                                    Scoreboard(
                                      player: null,
                                      counter: ties,
                                      namePlayer: 'Empates: ',
                                    ),
                                    Scoreboard(
                                      player: Player.PLAYER_2,
                                      counter: player2Wins,
                                      namePlayer: 'Robo: ',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Container(
                                child: Image(image: AssetImage('assets/$imageGameStage.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/ring.png',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 400,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Text(
                                      'Jogada Robô',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  child: Image(image: AssetImage('assets/$imagePlayer2.png')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(width: 100, child: Image.asset('assets/versus.png')),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  child: Image(image: AssetImage('assets/$imagePlayer1.png')),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Text(
                                      'Jogada ${widget.namePlayer1}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StandardButtom(
                      onPressButton: movePlays,
                      move: Move.ROCK,
                      invisibleButtom: imageGameStage,
                    ),
                    StandardButtom(
                      onPressButton: movePlays,
                      move: Move.PAPER,
                      invisibleButtom: imageGameStage,
                    ),
                    StandardButtom(
                      onPressButton: movePlays,
                      move: Move.SCISSORS,
                      invisibleButtom: imageGameStage,
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

  void movePlays(Move movePlayer1) {
    setState(() {
      player2Move = GenerateComputerMove().perform();
      player1Move = movePlayer1;
      winner = CheckWinner().run(player1Move, player2Move);
    });
    scorebord();
    winnerScreen();
  }

  void playsMade() {
    if (player2Move == Move.ROCK) {
      imagePlayer2 = 'rock';
    } else if (player2Move == Move.PAPER) {
      imagePlayer2 = 'paper';
    } else {
      imagePlayer2 = 'scissors';
    }

    if (player1Move == Move.ROCK) {
      imagePlayer1 = 'rock';
    } else if (player1Move == Move.PAPER) {
      imagePlayer1 = 'paper';
    } else {
      imagePlayer1 = 'scissors';
    }

    if (player1Move == null || player2Move == null) {
      imagePlayer1 = 'invisible';
      imagePlayer2 = 'invisible';
    }
  }

  void scorebord() {
    if (winner == null) {
      ties++;
      imageGameStage = 'tied';
    } else if (winner == WinnerMove.MOVE_1) {
      imageGameStage = 'win';
      player1Wins++;
    } else {
      imageGameStage = 'lost';
      player2Wins++;
    }
  }

  void winnerScreen() {
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        resetGameStage();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PlayAgain(
              winnerPlayer: winner,
              nameWinnerPlayer: widget.namePlayer1,
            ),
          ),
        );
      },
    );
  }

  void resetGameStage() {
    setState(
      () {
        player1Move = null;
        player2Move = null;
        imageGameStage = 'waiting';
      },
    );
  }
}
