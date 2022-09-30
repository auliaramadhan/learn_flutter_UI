import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import 'package:flutter_ui/widgets/button.dart';

class AutoRouteScaffold extends StatelessWidget {
  const AutoRouteScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _autoRouter = AppAutoRouteRouter();
    return WillPopScope(
      onWillPop: () async {
        if (_autoRouter.canPop()) {
          _autoRouter.pop();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: MaterialApp.router(
          routerDelegate: _autoRouter.delegate(
            navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
            // navigatorObservers: () => [AutoRouteObserver(), MyObserver()],
          ),
          routeInformationParser: _autoRouter.defaultRouteParser(),
          // builder: (context, child) {

          // },
        ),
      ),
    );
  }
}

class PageInitialScreen extends StatelessWidget {
  const PageInitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('initial route'),
            Text('initial route'),
            ButtonPrimary(
              text: "normal",
              onPressed: () {
                AutoRouter.of(context).push(PageNumberRoute(numberpae: 'asdasd'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageNumberScreen extends StatelessWidget {
  final String numberpae;

  const PageNumberScreen(
    this.numberpae, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('page number $numberpae'),
      ),
    );
  }
}
