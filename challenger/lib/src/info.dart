import 'package:flutter/widgets.dart';
import 'nameCollect.dart';

enum GameDecision {
  ONEPLAYER_,
  TWOPLAYER,
  ONLINE,
}

class Info with ChangeNotifier {
  String namePlayer1 = Nome().namePlayer;
}
