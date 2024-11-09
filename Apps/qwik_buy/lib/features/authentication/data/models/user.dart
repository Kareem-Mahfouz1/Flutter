class User {
  late String name;
  late String email;
  late String password;

  User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
