import 'dart:io';

void main(List<String> args) {
  var calc = new calculator();
  print('enter two numbers:');
  int first = int.parse(stdin.readLineSync()!);
  int second = int.parse(stdin.readLineSync()!);
  print('choose the operation:{ + , - , * , / }');
  var op = stdin.readLineSync()!;
  num res;
  switch (op) {
    case '+':
      res = calc.sum(first, second);
      break;
    case '-':
      res = calc.subtraction(first, second);
      break;
    case '*':
      res = calc.multiplication(first, second);
      break;
    case '/':
      res = calc.division(first, second);
      break;
    default:
      throw Exception('Invalid operation!');
  }
  print(res);
}

class calculator {
  sum(int x, int y) => x + y;
  subtraction(int x, int y) => x - y;
  multiplication(int x, int y) => x * y;
  division(int x, int y) {
    if (y == 0) throw Exception("Can't devide by zero!");
    return x / y;
  }
}
