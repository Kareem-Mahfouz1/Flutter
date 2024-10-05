class CharacterOrigin {
  late String name;

  CharacterOrigin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
