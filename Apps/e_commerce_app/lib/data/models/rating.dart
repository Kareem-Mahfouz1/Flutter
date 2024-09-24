class Rating {
  late double rate;
  late int count;

  Rating({
    required this.rate,
    required this.count,
  });

  Rating.fromMap(Map<String, dynamic> map) {
    rate = map['rate'];
    count = map['count'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'rate': rate,
      'count': count,
    };
    return map;
  }
}
