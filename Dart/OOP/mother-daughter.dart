void main(List<String> args) {
  var d = new daughter();
  d.display();
}

class mother {
  void display() {
    print('from mother');
  }
}

class daughter extends mother {
  @override
  void display() {
    print('from daughter');
  }
}
