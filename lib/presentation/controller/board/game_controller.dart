
import 'package:flutter_application_4/domain/player/player_model.dart';

class GameController {
  GameController._();
  static GameController _instance = GameController._();
  static GameController get instance => _instance;

  late List<List<String>> board;
  late String currentPlayer;
  late bool gameOver;
  late PlayerModel playerOne;
  late PlayerModel playerTwo;

  generatePlayers() async {
    playerOne =
        PlayerModel.fromJson({"playerName": "Jarne", "playerImage": "assets/images/jarne.png"});

    playerTwo =
        PlayerModel.fromJson({"playerName": "Angi", "playerImage": "assets/images/angi.png"});
  }

  generateBoard({required String firstPlayer}) {
    board = List.generate(3, (_) => List<String>.filled(3, ''));
    gameOver = false;
    currentPlayer = firstPlayer;
  }

  void makeMove(int row, int col) {
    if (!gameOver && board[row][col] == '') {
      board[row][col] = currentPlayer;
      if (checkWin(row, col)) {
        gameOver = true;
      } else if (board.every((row) => row.every((cell) => cell != ''))) {
        gameOver = true;
      } else {
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      }
    }
  }

  bool checkWin(int row, int col) {
    // Check rows, columns, and diagonals for a win.
    return (board[row][0] == currentPlayer &&
            board[row][1] == currentPlayer &&
            board[row][2] == currentPlayer) ||
        (board[0][col] == currentPlayer &&
            board[1][col] == currentPlayer &&
            board[2][col] == currentPlayer) ||
        (row == col &&
            board[0][0] == currentPlayer &&
            board[1][1] == currentPlayer &&
            board[2][2] == currentPlayer) ||
        (row + col == 2 &&
            board[0][2] == currentPlayer &&
            board[1][1] == currentPlayer &&
            board[2][0] == currentPlayer);
  }
}
