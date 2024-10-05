import 'character_origin.dart';

class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late String url;
  late CharacterOrigin origin;
  late String created;
  late List<dynamic> episode;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    url = json['url'];
    created = json['created'];
    episode = json['episode'];
    origin = CharacterOrigin.fromJson(json['origin']);
  }
}
