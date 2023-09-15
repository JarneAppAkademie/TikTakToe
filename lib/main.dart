
import 'package:flutter/material.dart';
import 'presentation/widgets/board/tictactoe_board.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToe(),
    );
  }
}
