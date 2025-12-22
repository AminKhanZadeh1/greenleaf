import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

setup() {
  // Theme

  // Dio
  // locator.registerLazySingleton<Dio>(() => ApiConfig.dio);

  // Caching Storage
}
