import 'dart:io';

void main(List<String> args) {
  Game tic = Game();
  tic.run_game();
}

class Player {
  late String name;
  String mark;
  Player(this.mark);
  setName() {
    print('player $mark,enter your name:');
    name = stdin.readLineSync()!;
  }
}

class Board {
  late List<List<String>> cells;
  int moveCount = 0;
  Board() {
    cells = List.generate(3, (w) => List.filled(3, ' '));
  }
  void display() {
    for (var row in cells) {
      print(row.join(' | '));
      print((row == cells.last) ? '' : '----------');
    }
  }

  place_mark(int row, int col, String symbol) {
    cells[row][col] = symbol;
    moveCount++;
  }

  bool is_full() {
    return moveCount == 9;
  }

  bool is_cell_empty(int row, int col) {
    return cells[row][col] == ' ';
  }
}

class Game {
  Player px = Player('X');
  Player po = Player('O');
  Board board = Board();
  late Player current_player;
  Game() {
    current_player = px;
  }
  void run_game() {
    setup_game();
    while (check_win() != true) {
      if (board.is_full()) {
        print("it's a draw :(");
        return;
      }
      board.display();
      print('${current_player.name}, enter row [1,2,3]:');
      var row = int.parse(stdin.readLineSync()!) - 1;
      print('${current_player.name}, enter column [1,2,3]:');
      var col = int.parse(stdin.readLineSync()!) - 1;
      if (board.is_cell_empty(row, col)) {
        board.place_mark(row, col, current_player.mark);
        switch_player();
      } else {
        print('invalid move!,try again');
      }
    }
    board.display();
    switch_player();
    print('Congrats to player ${current_player.name}!, You win!');
  }

  bool check_win() {
    //check rows
    for (var row in board.cells) {
      if (row[0] == row[1] && row[1] == row[2] && row[0] != ' ') return true;
    }
    //check columns
    for (int i = 0; i < 3; ++i) {
      if (board.cells[0][i] == board.cells[1][i] &&
          board.cells[1][i] == board.cells[2][i] &&
          board.cells[0][i] != ' ') return true;
    }
    // check diagonals
    if (board.cells[0][0] == board.cells[1][1] &&
        board.cells[1][1] == board.cells[2][2] &&
        board.cells[0][0] != ' ') return true;
    if (board.cells[0][2] == board.cells[1][1] &&
        board.cells[1][1] == board.cells[2][0] &&
        board.cells[0][2] != ' ') return true;
    return false;
  }

  void setup_game() {
    print('Welcome to Tic_Tac_Toe');
    px.setName();
    po.setName();
    print('Enjoy the game ;)');
    print('');
  }

  switch_player() {
    current_player = (current_player == px) ? po : px;
  }
}
