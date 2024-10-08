class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    main = map['main'];
    description = map['description'];
    icon = map['icon'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
    return map;
  }
}
