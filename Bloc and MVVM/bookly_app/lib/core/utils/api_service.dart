// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final _apiKey = dotenv.env['API_KEY'] ?? 'API_KEY_NOT_FOUND';
  final Dio _dio;

  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint&key=$_apiKey');

    return response.data;
  }
}
