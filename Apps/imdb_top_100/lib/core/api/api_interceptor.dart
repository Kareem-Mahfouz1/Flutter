import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-rapidapi-key'] = dotenv.get('API_KEY');
    super.onRequest(options, handler);
  }
}
