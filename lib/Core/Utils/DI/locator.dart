import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:greenleaf/Features/Home/Data/Source/Remote/home_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Config/API/api_config.dart';
import '../../../Config/Theme/app_theme.dart';

final GetIt locator = GetIt.instance;

setup() async {
  // Theme
  locator.registerSingleton<ThemeData>(AppTheme.lightTheme);

  // Dio
  locator.registerLazySingleton<Dio>(() => ApiConfig.dio);

  // Caching Storage
  locator.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  // API service
  locator.registerLazySingleton<HomeApiService>(
    () => HomeApiService(locator()),
  );
}
