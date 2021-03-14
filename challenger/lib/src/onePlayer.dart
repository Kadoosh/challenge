import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:challenger/src/components/patternButtom.dart';
import 'package:challenger/src/info.dart';
import 'package:challenger/src/mainMenu.dart';
import 'package:challenger/src/moves.dart';
import 'package:challenger/src/playAgain.dart';
import 'package:flutter/material.dart';

class OnePlayer extends StatefulWidget {
  static AudioCache player = AudioCache();
  @override
  _OnePlayerState createState() => _OnePlayerState();
}

class _OnePlayerState extends State<OnePlayer> {
  int winners, defeats, ties;

  final player = AudioCache();

  String imagePlayer1;
  String imagePlayer2;

  int indexGameStates;
  var gameStates = [
    Image(image: AssetImage('assets/ganhou.png')),
    Image(image: AssetImage('assets/tied.png')),
    Image(image: AssetImage('assets/perdeu.png')),
    Image(image: AssetImage('assets/esperando.png')),
  ];

  int _start = 15;

  Move player1Move;
  Move player2Move;
  WinnerMove winner;

  @override
  void initState() {
    super.initState();

    setState(
      () {
        winners = 0;
        defeats = 0;
        ties = 0;
        indexGameStates = 3;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (player2Move == Move.ROCK) {
      imagePlayer2 = 'pedra';
    } else if (player2Move == Move.PAPER) {
      imagePlayer2 = 'papel';
    } else {
      imagePlayer2 = 'tesoura';
    }

    if (player1Move == Move.ROCK) {
      imagePlayer1 = 'pedra';
    } else if (player1Move == Move.PAPER) {
      imagePlayer1 = 'papel';
    } else {
      imagePlayer1 = 'tesoura';
    }
    if (player1Move == null || player2Move == null) {
      imagePlayer1 = 'transparente';
      imagePlayer2 = 'transparente';
    }
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
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
                                    setState(() {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => MainMenu(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/voltar.png'),
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
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/user1.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          Flexible(
                                            child: Container(
                                              child: Text(
                                                '${Info().namePlayer1}:',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            winners.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/empate.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          Container(
                                            child: Text(
                                              'Empate:',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ties.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/maquina.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          Text(
                                            'Robô:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            defeats.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Container(
                                  child: gameStates[indexGameStates],
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
                        'assets/ringue.png',
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
                                      'Jogada ${Info().namePlayer1}',
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
                      invisibleButtom: indexGameStates,
                    ),
                    StandardButtom(
                      onPressButton: movePlays,
                      move: Move.PAPER,
                      invisibleButtom: indexGameStates,
                    ),
                    StandardButtom(
                      onPressButton: movePlays,
                      move: Move.SCISSORS,
                      invisibleButtom: indexGameStates,
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

  void movePlays(Move movePlayer) {
    setState(() {
      player2Move = MoveRobot().moveRobot();
      player1Move = movePlayer;
      winner = CheckWinner().run(player1Move, player2Move);
    });

    scorebord();
    delayBottom();
  }

  void scorebord() {
    if (winner == null) {
      ties++;
      indexGameStates = 1;
    } else if (winner == WinnerMove.MOVE_1) {
      indexGameStates = 0;
      winners++;
    } else {
      indexGameStates = 2;
      defeats++;
    }
  }

  void delayBottom() {
    _start = 1;
    final oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          player.play('click.mp3');
          player1Move = null;
          player2Move = null;
          indexGameStates = 3;

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlayAgain(
                winnerPlayer: winner,
                nameWinnerPlayer: Info().namePlayer1,
              ),
            ),
          );

          setState(() {
            timer.cancel();
          });
        } else {
          setState(
            () {
              _start--;
            },
          );
        }
      },
    );
  }
}
