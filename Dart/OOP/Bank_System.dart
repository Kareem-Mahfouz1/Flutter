void main(List<String> args) {}

class Bank {
  List<client> clients = [];
  List<employee> employees = [];
  employee? man;
  String branch_name;
  Bank(this.branch_name, this.man);
  update_manager(employee new_man) => man = new_man;
  add_client(client c) => clients.add(c);
  add_employee(employee e) => employees.add(e);
  display_emplyees() {
    for (var em in employees) {
      em.display();
    }
  }

  display_clients() {
    for (var cl in clients) {
      cl.display();
    }
  }
}

class client {
  int id;
  String name;
  double balance;
  double interset;
  client(this.id, this.name, this.balance, this.interset);
  deposit(double amount) {
    balance += amount;
    print('deposit succesful');
    display_balance();
  }

  withdraw(double amount) {
    if (amount > balance)
      print('insufficient balance');
    else {
      balance -= amount;
      print('withdrawl succesful');
      display_balance();
    }
  }

  apply_interest(int months) {
    while (months-- != 0) balance = balance + (balance * interset);
  }

  display_balance() => print('current balance is: $balance');
  display() => print(
      'client name : $name\nid : $id\nbalance : $balance\ninterest : $interset');
}

class employee {
  int id;
  String name;
  double salary;
  String role;
  employee(this.id, this.name, this.role, this.salary);
  update_salary(double new_sal) => salary = new_sal;
  display() =>
      print('employee name : $name\nid : $id\nsalary : $salary\nrole : $role');
}
