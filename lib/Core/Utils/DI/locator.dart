import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:greenleaf/Features/Cart/Data/Repository/cart_repo_impl.dart';
import 'package:greenleaf/Features/Cart/Domain/Repository/cart_repo.dart';
import 'package:greenleaf/Features/Cart/Presentation/Bloc/cart_bloc.dart';
import 'package:greenleaf/Features/Favorites/Data/Repository/favorites_repo_impl.dart';
import 'package:greenleaf/Features/Favorites/Data/Source/Local/favorites_local_source.dart';
import 'package:greenleaf/Features/Favorites/Domain/Repository/favorites_repo.dart';
import 'package:greenleaf/Features/Home/Data/Repository/home_repo_impl.dart';
import 'package:greenleaf/Features/Home/Data/Source/Remote/home_api_service.dart';
import 'package:greenleaf/Features/Home/Domain/Repository/home_repo.dart';
import 'package:greenleaf/Features/Home/Presentation/Bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Config/API/api_config.dart';
import '../../../Config/Theme/app_theme.dart';
import '../../../Features/Cart/Data/Source/Local/cart_local_source.dart';

final GetIt locator = GetIt.instance;

setup() async {
  // Theme
  locator.registerSingleton<ThemeData>(AppTheme.lightTheme);

  // Dio
  locator.registerLazySingleton<Dio>(() => ApiConfig.dio);

  // Caching Storage
  // SharedPreferences آماده
  final prefs = await SharedPreferences.getInstance();

  // CartLocalSource register
  locator.registerSingleton<CartLocalSource>(CartLocalSource(prefs));
  locator.registerSingleton<FavoritesLocalSource>(FavoritesLocalSource(prefs));

  // API service
  locator.registerLazySingleton<HomeApiService>(
    () => HomeApiService(locator()),
  );

  // Repository
  locator.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(locator()));

  locator.registerLazySingleton<CartRepo>(() => CartRepoImpl(locator()));

  locator.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(locator()),
  );

  // Blocs
  locator.registerLazySingleton<HomeBloc>(() => HomeBloc(locator()));
  locator.registerLazySingleton<CartBloc>(() => CartBloc(locator()));
}
