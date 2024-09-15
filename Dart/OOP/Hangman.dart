import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  Game().run_game();
}

class Game {
  Word word = Word();
  int moves = 0;
  int limit = 5;
  check_win() {
    for (var element in word.guessed) {
      if (element == false) {
        if (moves >= limit)
          return 0; //lose
        else
          return 1; //continue
      }
    }
    return 2; //win
  }

  game_intro() {
    print('Welcome to Hangman ;)');
    print('You have $limit tries to guess the word');
    print('Enjoy :)\n');
  }

  take_letter() {
    print('Enter a letter : ');
    return stdin.readLineSync()!.toLowerCase();
  }

  run_game() {
    game_intro();
    while (check_win() == 1) {
      print('');
      word.display();
      print('Mistakes left : ${limit - moves}\n');
      moves = word.place_letter(take_letter(), moves);
      print('_____________________________');
    }
    print('The word was ${word.wrd}');
    if (check_win() == 2)
      print('Congrats you win !!!');
    else
      print('you lost :(,womp womp');
  }
}

class Word {
  late String wrd;
  late int length;
  late List<bool> guessed;
  List ltrs = [];
  Word() {
    var rnd = Random();
    wrd = dict[rnd.nextInt(dict.length)];
    length = wrd.length;
    guessed = List.filled(length, false);
  }

  display() {
    for (int i = 0; i < length; i++) {
      stdout.write(guessed[i] ? wrd[i] : '_');
      stdout.write(' ');
    }
    print('\n\nGuessed letters : ${ltrs.join('-')}\n');
  }

  place_letter(String ltr, moves) {
    if (ltr.length > 1 || ltr.isEmpty) //letter validation
      print('Please enter just one letter >:(');
    else {
      if (ltrs.contains(ltr))
        print('This letter was already guessed');
      else {
        //letter processing
        ltrs.add(ltr);
        if (!wrd.contains(ltr)) {
          print('Wrong letter !!!!!!!!!!!!');
          moves++;
        } else {
          for (int i = 0; i < length; i++) {
            if (wrd[i] == ltr) guessed[i] = true;
          }
        }
      }
    }
    return moves;
  }
}

List dict = [
  'hello',
  'world',
  'football',
  'tennis',
  'basketball',
  'english',
  'hangman',
  'keyboard',
  'arabic',
  'chair',
  'table',
  'sofa',
  'phone',
  'mouse',
  'cheese',
  'chess'
];
