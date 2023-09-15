
import 'package:flutter/material.dart';

import '../../controller/board/game_controller.dart';
import '../player/player_icon.dart';


class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  void initState() {
    super.initState();
    GameController.instance.generatePlayers();

    GameController.instance.generateBoard(firstPlayer: 'O');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              shrinkWrap:
                  true, // Add this line to constrain the GridView's height.
              itemBuilder: (context, index) {
                final row = index ~/ 3;
                
                final col = index % 3;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      GameController.instance.makeMove(row, col);
                      if (GameController.instance.gameOver) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Game finished'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    GameController.instance
                                        .generateBoard(firstPlayer: 'X');
                                  });
                                },
                                child: Text('Play Again'),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: GameController.instance.board[row][col] != ''
                          ? GameController.instance.board[row][col] == 'X'
                              ? PlayerIcon(
                                  player: GameController.instance.playerOne)
                              : PlayerIcon(
                                  player: GameController.instance.playerTwo)
                          : Container(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            if (GameController.instance.gameOver)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    GameController.instance.generateBoard(firstPlayer: 'X');
                  });
                },
                child: Text('Restart'),
              ),
          ],
        ),
      ),
    );
  }
}
