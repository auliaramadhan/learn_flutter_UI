import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/state_management/todo/todo_page.dart';
import 'package:flutter_ui/utils/debug.dart';
import '../test_screen/scaffold_advanced.dart';
import '../test_screen/route_aware.dart';
import '../test_screen/widget_basic.dart';

part 'auto_routes.gr.dart';

@MaterialAutoRouter(
  // harus ada screen di namanya akan diganti Route
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: WidgetBasicScreen, initial: true),
    AutoRoute(page: AdvanceScaffoldScreen ),
    AutoRoute(page: RouteAwareScreen ),
    AutoRoute(page: TodoScreen  ),
  ],
)
class AppRouter extends _$AppRouter {}

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
