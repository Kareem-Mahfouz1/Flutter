import 'package:weather_app/data/models/clouds.dart';
import 'package:weather_app/data/models/main_details.dart';
import 'package:weather_app/data/models/sys.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/wind.dart';

class ForecastEntry {
  late int dt;
  late MainDetails main;
  late List<Weather> weather;
  late Clouds clouds;
  late Wind wind;
  late int visibility;
  late int pop;
  late Sys sys;
  late String dt_txt;

  ForecastEntry({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dt_txt,
  });

  ForecastEntry.fromMap(Map<String, dynamic> map) {
    dt = map['dt'];
    main = MainDetails.fromMap(map['main']);
    weather = [];
    (map['weather'] as List).forEach(
      (element) {
        weather.add(Weather.fromMap(element));
      },
    );
    clouds = Clouds.fromMap(map['clouds']);
    wind = Wind.fromMap(map['wind']);
    visibility = map['visibility'];
    pop = map['pop'];
    sys = Sys.fromMap(map['sys']);
    dt_txt = map['dt_txt'];
  }

  Map<String, dynamic> toMap() {
    List<Map> tempWeather = [];
    weather.forEach(
      (element) {
        tempWeather.add(element.toMap());
      },
    );
    Map<String, dynamic> map = {
      'dt': dt,
      'main': main.toMap(),
      'weather': tempWeather,
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'sys': sys.toMap(),
      'dt_txt': dt_txt,
    };
    return map;
  }
}
