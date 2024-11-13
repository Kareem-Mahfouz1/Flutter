import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WebService {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'https://asos2.p.rapidapi.com/',
    headers: {'x-rapidapi-key': dotenv.env['API_KEY'] ?? 'API_KEY_NOT_FOUND'},
  );
  late Dio _dio;

  WebService() {
    _dio = Dio(_baseOptions);
  }
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }
}
