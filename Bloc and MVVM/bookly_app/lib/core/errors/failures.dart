import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioExceprion) {
    switch (dioExceprion.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Certification failed');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExceprion.response!.statusCode!, dioExceprion.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioExceprion.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unknown Error');
        }
      default:
        return ServerFailure(
            'Oops, there was an error. Please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response['error']['message']);
      case 404:
        return ServerFailure(
            'Your request is not found,please try again later!');
      case 500:
        return ServerFailure('internal server error,please try again later!');
      default:
        return ServerFailure(
            'Oops, there was an error. Please try again later');
    }
  }
}
