class Name {
  late String firstname;
  late String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  Name.fromMap(Map<String, dynamic> map) {
    firstname = map['firstname'];
    lastname = map['lastname'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'firstname': firstname,
      'lastname': lastname,
    };
    return map;
  }
}
