import 'package:weather_app/data/models/weather_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  static const _apiKey = '';
  static const _baseUrl = 'https://api.openweathermap.org';

  static Future<WeatherResponse> getApiData() async {
    String url =
        '$_baseUrl/data/2.5/forecast?lat=30.9648072430856&lon=31.1651787880201&units=metric&appid=$_apiKey';
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return WeatherResponse.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
