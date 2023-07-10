import "package:flutter/material.dart";
import "package:pupbook/models/app_route.dart";
import "package:pupbook/pages/animals.dart";
import "package:pupbook/pages/home.dart";
import "package:pupbook/pages/unifei_dogs.dart";

List<AppRoute> appRoutes = const [
  AppRoute(name: 'Início', route: '/home', component: Home(), icon: Icons.home),
  AppRoute(
      name: 'Cães da Unifei',
      route: '/unifei-dogs',
      component: UnifeiDogs(),
      icon: Icons.domain),
  AppRoute(
      name: 'Pets', route: '/animals', component: Animals(), icon: Icons.pets),
];
