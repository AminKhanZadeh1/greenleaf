import 'package:dio/dio.dart';
import 'package:greenleaf/Config/API/api_config.dart';

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
      return TimeoutFailure(ApiConfig.timeOutError);
    case DioExceptionType.sendTimeout:
      return TimeoutFailure(ApiConfig.timeOutError);
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure(ApiConfig.timeOutError);
    case DioExceptionType.connectionError:
      return NetworkFailure(ApiConfig.timeOutError);
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
      return UnknownFailure('Unknown Error!');
  }
}
