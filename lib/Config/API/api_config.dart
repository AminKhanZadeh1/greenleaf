import 'package:dio/dio.dart';

class ApiConfig {
  static final Dio dio = Dio(BaseOptions(connectTimeout: timeOutDuration));
  static const String serverError = 'Server error!';
  static const String timeOutError = 'Check your internet connection!';

  static const Duration timeOutDuration = Duration(seconds: 7);
}
