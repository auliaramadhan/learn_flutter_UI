import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/test_screen/starter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import 'theme.dart';
import 'utils/routes.dart';

// FOR ROUTEAWARE
// final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme(context),
      themeMode: ThemeMode.light,
      //------------ my normal Route----------
      // onGenerateRoute: RoutesApp.generateRoute,
      // initialRoute: '/',
      // navigatorObservers: [routeObserver],

      // ---auto route------
      // routerDelegate: _autoRouter.delegate(
      //   navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
      //   // navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
      // ),
      // routeInformationParser: _autoRouter.defaultRouteParser(),

      home: const StarterWidget(),
    );
  }
}
