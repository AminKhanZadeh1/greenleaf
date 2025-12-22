import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenleaf/Core/Utils/Constants/constants.dart';
import 'package:greenleaf/Core/Utils/Params/params.dart';

import '../../../../../Config/API/api_config.dart';
import '../../../../../Core/Utils/Failures/failures.dart';

class HomeApiService {
  final Dio _dio;

  HomeApiService(this._dio);

  Future<Result<Map<String, dynamic>>> getItems() async {
    try {
      final response = await _dio
          .get(Constants.url)
          .timeout(ApiConfig.timeOutDuration);

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.data));
      } else {
        return Left(ServerFailure(ApiConfig.serverError));
      }
    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(TimeoutFailure(ApiConfig.timeOutError));
    }
  }
}
