import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenleaf/Core/Utils/DI/locator.dart';

import '../../../Features/Cart/Presentation/Bloc/cart_bloc.dart';
import '../../../Features/Home/Presentation/Bloc/home_bloc.dart';
import '../../../Features/Home/Presentation/Pages/home_page.dart';

class Routes {
  static const String homePath = '/';

  static final GoRouter appRouter = GoRouter(
    initialLocation: homePath,
    routes: [
      GoRoute(
        path: homePath,
        name: 'home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeBloc(locator())),
            BlocProvider(create: (context) => CartBloc(locator())),
          ],
          child: const HomePage(),
        ),
      ),
    ],
  );
}
