import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui/utils/auto_routes.dart';
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
  final _autoRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      themeMode: ThemeMode.light,
      //------------ my normal Route----------
      // onGenerateRoute: RoutesApp.generateRoute,
      // initialRoute: '/',
      // navigatorObservers: [routeObserver],

      // ---auto route------
      routerDelegate: _autoRouter.delegate(
        navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
        // navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
      ),
      routeInformationParser: _autoRouter.defaultRouteParser(),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
