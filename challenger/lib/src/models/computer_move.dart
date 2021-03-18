import 'dart:math';
import 'package:challenger/src/services/winner_move.dart';

class GenerateComputerMove {
  Move perform() {
    int randomMove = Random().nextInt(Move.values.length);
    return Move.values.elementAt(randomMove);
  }
}
