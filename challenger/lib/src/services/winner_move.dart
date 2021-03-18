enum Move {
  ROCK,
  PAPER,
  SCISSORS,
}

enum WinnerMove {
  MOVE_1,
  MOVE_2,
}

class CheckWinner {
  WinnerMove run(Move movePlayer1, Move movePlayer2) {
    bool tied = movePlayer1 == movePlayer2;
    bool player1WinsUsingRock = movePlayer1 == Move.ROCK && movePlayer2 == Move.SCISSORS;
    bool player1WinsUsingScissors = movePlayer1 == Move.SCISSORS && movePlayer2 == Move.PAPER;
    bool player1WinsUsingPaper = movePlayer1 == Move.PAPER && movePlayer2 == Move.ROCK;

    if (tied) {
      return null;
    }

    if (player1WinsUsingRock || player1WinsUsingScissors || player1WinsUsingPaper) {
      return WinnerMove.MOVE_1;
    }

    return WinnerMove.MOVE_2;
  }
}
