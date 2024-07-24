void main(List<String> args) {}

class Employee {
  int id;
  String name;
  String position;
  String email;
  Employee(this.name, this.id, this.position, this.email);
  update_profile(String new_name, String new_email) {
    name = new_name;
    email = new_email;
  }
}

class Client {
  int id;
  String contact_name;
  String email;
  List services = [];
  Client(this.contact_name, this.id, this.email);
  add_service(String service) => services.add(service);
}

class task {
  int id;
  String description;
  Employee assigned_to;
  DateTime duedate;
  task(this.id, this.description, this.assigned_to, this.duedate);
  update_description(String new_desription) => description = new_desription;
  reassign_to(Employee new_employee) {
    assigned_to = new_employee;
  }
}
