class Wind {
  late double speed;
  late int deg;
  late double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  Wind.fromMap(Map<String, dynamic> map) {
    speed = map['speed'];
    deg = map['deg'];
    gust = map['gust'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
    return map;
  }
}
