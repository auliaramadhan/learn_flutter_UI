import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'auto_route_initial.dart';
import '../../../utils/debug.dart';

part './auto_routes.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(
  // harus ada screen di namanya akan diganti Route
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: PageInitialScreen, initial: true),
    AutoRoute(page: PageNumberScreen),
  ],
)
class AppAutoRouteRouter extends _$AppAutoRouteRouter {}

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Debug.log('observer New route pushed: ${route.settings.name}');
    Debug.log('observer previous route: ${previousRoute?.settings.name ?? "none"}');
    // super.didPush(route, previousRoute)
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    Debug.log('observer New route pop: ${route.settings.name}');
    Debug.log('observer previous route : ${previousRoute?.settings.name ?? "none"}');
  }
  @override
  void didRemove(Route route, Route? previousRoute) {
    Debug.log('observer New route pop: ${route.settings.name}');
    Debug.log('observer previous route : ${previousRoute?.settings.name ?? "none"}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    Debug.log('observer Tab route visited: ${route.name}');
    Debug.log('observer previous route pop: ${previousRoute?.name ?? "none"}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    Debug.log('observer Tab route re-visited: ${route.name}');
    Debug.log('observer previous route pop: ${previousRoute.name}');
  }
}
