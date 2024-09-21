import 'package:weather_app/data/models/city.dart';
import 'package:weather_app/data/models/forecast_entry.dart';

class WeatherResponse {
  late String cod;
  late int message;
  late int cnt;
  late List<ForecastEntry> list;
  late City city;

  WeatherResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  WeatherResponse.fromMap(Map<String, dynamic> map) {
    cod = map['cod'];
    message = map['message'];
    cnt = map['cnt'];
    list = [];
    (map['list'] as List).forEach(
      (element) {
        list.add(ForecastEntry.fromMap(element));
      },
    );
    city = City.fromMap(map['city']);
  }

  Map<String, dynamic> toMap() {
    List<Map> tempList = [];
    list.forEach((element) {
      tempList.add(element.toMap());
    });
    Map<String, dynamic> map = {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': tempList,
      'city': city.toMap(),
    };
    return map;
  }
}
