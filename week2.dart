import 'dart:io'
  
void main() {
  print('test');
  task3();
}

task1() {
  print('please enter your name and age :');
  var name = stdin.readLineSync();
  int? age = int.parse(stdin.readLineSync()!);
  print(100 - age);
}

task2() {
  print('enter a number :');
  int? number = int.parse(stdin.readLineSync()!);
  print(number.isEven ? 'even' : 'odd');
}

task3() {
  print('enter a number :');
  int? number = int.parse(stdin.readLineSync()!);
  Set<int> res = {};
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      res.addAll([number ~/ i, i]);
    }
  }
  print(res);
}

task5(List<num> nums) {
  return [nums[0], nums[nums.length - 1]];
}
