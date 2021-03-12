import 'dart:math';

class MoveRobot {
  Move moveRobot() {
    int randomMove = Random().nextInt(3);
    return Move.values.elementAt(randomMove);
  }
}

enum Move {
  ROCK,
  PAPER,
  SCISSORS,
}

enum Player {
  PLAYER_1,
  PLAYER_2,
}

enum WinnerMove {
  MOVE_1,
  MOVE_2,
}

class CheckWinner {
  WinnerMove run(Move movePlayer1, Move movePlayer2) {
    bool tied = movePlayer1 == movePlayer2;
    bool player1winnerWithCase1 = movePlayer1 == Move.ROCK && movePlayer2 == Move.SCISSORS;
    bool player1winnerWithCase2 = movePlayer1 == Move.SCISSORS && movePlayer2 == Move.PAPER;
    bool player1winnerWithCase3 = movePlayer1 == Move.PAPER && movePlayer2 == Move.ROCK;

    if (tied) {
      return null;
    }

    if (player1winnerWithCase1 || player1winnerWithCase2 || player1winnerWithCase3) {
      return WinnerMove.MOVE_1;
    }
    return WinnerMove.MOVE_2;
  }
}
