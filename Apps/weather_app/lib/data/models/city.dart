import 'package:weather_app/data/models/coord.dart';

class City {
  late int id;
  late String name;
  late Coord coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  City.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    coord = Coord.fromMap(map['coord']);
    country = map['country'];
    population = map['population'];
    timezone = map['timezone'];
    sunrise = map['sunrise'];
    sunset = map['sunset'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'coord': coord.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
    return map;
  }
}
