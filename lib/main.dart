import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Config/Theme/app_theme.dart';
import 'Core/Utils/DI/locator.dart';
import 'Core/Utils/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setup();
  runApp(const MyApp());
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
