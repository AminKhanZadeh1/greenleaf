import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class TimeoutFailure extends Failure {
  TimeoutFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

Failure handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return TimeoutFailure('اتصال اینترنت را بررسی کنید!');
    case DioExceptionType.sendTimeout:
      return TimeoutFailure('اتصال اینترنت را بررسی کنید!');
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure('اتصال اینترنت را بررسی کنید!');
    case DioExceptionType.connectionError:
      return NetworkFailure('اتصال اینترنت را بررسی کنید!');
    case DioExceptionType.badResponse:
    // try {
    //   final data = e.response?.data;
    // } catch (_) {
    //   // Ignore parsing failure and return generic server failure
    // }
    // return ServerFailure(
    //   'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}',
    // );
    default:
      return UnknownFailure('خطایی رخ داد!');
  }
}
