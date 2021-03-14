import 'package:challenger/src/info.dart';
import 'package:challenger/src/mainMenu.dart';
import 'package:challenger/src/moves.dart';

import 'package:flutter/material.dart';

class TwoPlayers extends StatefulWidget {
  @override
  _TwoPlayersState createState() => _TwoPlayersState();
}

class _TwoPlayersState extends State<TwoPlayers> {
  int winners, defeats, ties;

  int indexGameStates = 3;
  var gameStates = [
    Image(image: AssetImage('assets/ganhou.png')),
    Image(image: AssetImage('assets/tied.png')),
    Image(image: AssetImage('assets/perdeu.png')),
    Image(image: AssetImage('assets/esperando.png')),
  ];

  var rockPaperScissors = [
    Image(image: AssetImage('assets/pedra.png')),
    Image(image: AssetImage('assets/papel.png')),
    Image(image: AssetImage('assets/tesoura.png')),
    Image(image: AssetImage('assets/transparente.png')),
  ];

  Move player1Move;
  Move player2Move;
  WinnerMove winner;

  @override
  void initState() {
    super.initState();

    setState(() {
      winners = 0;
      defeats = 0;
      ties = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
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
                                      Navigator.of(context).pushReplacement(
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
                                                image: AssetImage('assets/1user.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          Text(
                                            '${Info().namePlayer1}:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              backgroundColor: Colors.white,
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
                                                image: AssetImage('assets/tied.png'),
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
                                            'Robo:',
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
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 390,
                    child: Container(
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
                            width: 100,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'Jogada Robo',
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: rockPaperScissors[player2Move?.index ?? 3],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(width: 100, child: Image.asset('assets/versus.png')),
                          Container(
                            width: 400,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: rockPaperScissors[player1Move?.index ?? 3],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'Jogada ${Info().namePlayer1}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        player2Move = MoveRobot().moveRobot();
                                        player1Move = Move.ROCK;
                                        winner = CheckWinner().run(player1Move, player2Move);
                                      },
                                    );
                                    placar();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/pedra.png'),
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
                      SizedBox(
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        player2Move = MoveRobot().moveRobot();
                                        player1Move = Move.PAPER;
                                        winner = CheckWinner().run(player1Move, player2Move);
                                      },
                                    );
                                    placar();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/papel.png'),
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
                      SizedBox(
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        player2Move = MoveRobot().moveRobot();
                                        player1Move = Move.SCISSORS;
                                        winner = CheckWinner().run(player1Move, player2Move);
                                      },
                                    );
                                    placar();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/tesoura.png'),
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic movePlay() {
    ElevatedButton(
      onPressed: () {
        setState(
          () {
            player2Move = MoveRobot().moveRobot();
            player1Move = Move.SCISSORS;
            winner = CheckWinner().run(player1Move, player2Move);
          },
        );
        placar();
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/tesoura.png'),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  void placar() {
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
}
