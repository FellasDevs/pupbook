import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pupbook/globals/app_routes.dart';

class RouterNavigation extends StatelessWidget {
  final Widget body;
  final String currentScreen;

  const RouterNavigation(
      {super.key, required this.body, required this.currentScreen});

  getCurrentIndex() {
    return appRoutes.indexWhere((route) => currentScreen == route.route);
  }

  @override
  Widget build(BuildContext context) {
    changeRoute(int index) {
      context.go(appRoutes.elementAt(index).route);
    }

    return Scaffold(
        body: SafeArea(child: body),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              selectedIndex: getCurrentIndex(),
              onTabChange: (index) => changeRoute(index),
              backgroundColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.onPrimary,
              tabBackgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              activeColor: Theme.of(context).colorScheme.onSecondary,
              gap: 8,
              padding: const EdgeInsets.all(16),
              tabs: List<GButton>.from(appRoutes
                  .map((route) => GButton(text: route.name, icon: route.icon))),
            ),
          ),
        ));
  }
}
