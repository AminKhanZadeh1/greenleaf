import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Config/Theme/app_theme.dart';
import 'Core/Utils/DI/locator.dart';
import 'Core/Utils/Routes/routes.dart';
import 'Features/Favorites/Presentation/Cubit/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setup();
  runApp(BlocProvider(create: (_) => FavoriteCubit(locator()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.appRouter,
      theme: AppTheme.lightTheme,
    );
  }
}
