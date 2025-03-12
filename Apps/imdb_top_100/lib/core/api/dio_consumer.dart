import 'package:dio/dio.dart';
import 'package:imdb_top_100/core/api/api_consumer.dart';
import 'package:imdb_top_100/core/api/api_interceptor.dart';
import 'package:imdb_top_100/core/api/end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
  }
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
