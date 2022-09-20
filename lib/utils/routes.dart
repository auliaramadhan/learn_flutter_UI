import 'package:flutter/material.dart';
import '../test_screen/route_aware/route_aware.dart';
import '../test_screen/scaffold_advanced.dart';
import '../test_screen/widget_basic.dart';

class RoutesName {
  RoutesName._();
  static const WidgetBasic = '/';
  static const AdvanceScaffold = '/advanceScaffold';
  static const RouteObservereScreen = '/routeObservereScreen';
}

class RoutesApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case RoutesName.WidgetBasic:
        return MaterialPageRoute(builder: (_) => WidgetBasicScreen());
      case RoutesName.AdvanceScaffold:
        return MaterialPageRoute(builder: (_) => AdvanceScaffoldScreen());
      case RoutesName.RouteObservereScreen:
        return MaterialPageRoute(builder: (_) => RouteAwareScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

// FOR ROUTEAWARE
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {}
  @override
  void didStopUserGesture() {}
}
