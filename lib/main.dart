import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pupbook/components/layout/route_navigation.dart';
import 'package:pupbook/globals/app_routes.dart';
import 'package:pupbook/utils/generate_material_color.dart';

import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: appRoutes.first.route,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return RouterNavigation(body: child, currentScreen: state.location);
      },
      routes: List<RouteBase>.from(appRoutes.map((route) => GoRoute(
            path: route.route,
            builder: (context, state) {
              return route.component;
            },
          ))),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PupBook',
      theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFFD9340),
            onPrimary: Colors.white,
            secondary: Color(0xFFFED17A),
            onSecondary: Color(0xFFBC8A28),
            secondaryContainer: Color(0xFFFFEDC9),
            tertiary: Color(0xFF5A74AA),
            tertiaryContainer: Color(0xFFB9C7E5),
            onTertiaryContainer: Color(0xFF25417E),
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Color(0xFF19726F),
            onSurface: Color(0xFFB1E1DF),
          ),
          primarySwatch: generateMaterialColor(const Color(0xFFFD9340))),
      routerConfig: _router,
    );
  }
}
