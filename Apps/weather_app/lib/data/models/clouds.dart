class Clouds {
  late int all;

  Clouds({
    required this.all,
  });

  Clouds.fromMap(Map<String, dynamic> map) {
    all = map['all'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'all': all,
    };
    return map;
  }
}
