class Geolocation {
  late String lat;
  late String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  Geolocation.fromMap(Map<String, dynamic> map) {
    lat = map['lat'];
    long = map['long'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'lat': lat,
      'long': long,
    };
    return map;
  }
}
