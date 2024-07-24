void main(List<String> args) {
  var zebra = Zebra('ssa', 10, 'land');
  var dolphine = Dolphine('DDa', 3, 'water');
  zebra.printInfo();
  dolphine.printInfo();
}

class Animal {
  String name;
  int age;
  Animal(this.name, this.age);
  set_value(String newname, int newage) {
    this.name = newname;
    this.age = newage;
  }
}

class Zebra extends Animal {
  String origin;
  Zebra(String name, int age, this.origin) : super(name, age);
  printInfo() => print('name:$name, age:$age, origin:$origin');
}

class Dolphine extends Animal {
  String origin;
  Dolphine(String name, int age, this.origin) : super(name, age);
  printInfo() => print('name:$name, age:$age, origin:$origin');
}
