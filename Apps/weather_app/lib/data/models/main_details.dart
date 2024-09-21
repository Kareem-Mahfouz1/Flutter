class MainDetails {
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int pressure;
  late int sea_level;
  late int grnd_level;
  late int humidity;
  late double temp_kf;

  MainDetails({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    required this.temp_kf,
  });

  MainDetails.fromMap(Map<String, dynamic> map) {
    temp = map['temp'];
    feels_like = (map['feels_like'] ?? 0).toDouble();
    temp_min = map['temp_min'];
    temp_max = map['temp_max'];
    pressure = map['pressure'];
    sea_level = map['sea_level'];
    grnd_level = map['grnd_level'];
    humidity = map['humidity'];
    temp_kf = (map['temp_kf'] ?? 0).toDouble();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'sea_level': sea_level,
      'grnd_level': grnd_level,
      'humidity': humidity,
      'temp_kf': temp_kf,
    };
    return map;
  }
}
