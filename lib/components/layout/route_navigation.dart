import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pupbook/globals/app_routes.dart';

class RouterNavigation extends StatefulWidget {
  final Widget body;
  const RouterNavigation({super.key, required this.body});

  @override
  State<RouterNavigation> createState() => _RouterNavigationState();
}

class _RouterNavigationState extends State<RouterNavigation> {
  changeRoute(int index) {
    context.go(appRoutes.elementAt(index).route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: widget.body),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              onTabChange: (index) => changeRoute(index),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
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
