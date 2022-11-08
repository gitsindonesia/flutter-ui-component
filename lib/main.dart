import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';

import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  runApp(BlocProvider(
    create: (context) => GlobalCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode =
        context.select((GlobalCubit cubit) => cubit.state.themeMode);

    final routes = Routes.routes;

    return MaterialApp.router(
      title: 'Gits Flutter UI Component',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      routerDelegate: routes.routerDelegate,
    );
  }
}
