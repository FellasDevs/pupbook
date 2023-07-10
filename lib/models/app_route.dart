import 'package:flutter/cupertino.dart';

class AppRoute {
  final String name;
  final String route;
  final IconData icon;
  final Widget component;

  const AppRoute(
      {required this.name,
      required this.route,
      required this.component,
      required this.icon});
}
